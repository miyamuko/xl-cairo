require "rubygems"
require "hpricot"

module CairoDocument

  class Book
    attr_reader :chapters

    def initialize(base = ".")
      @base = base
      @doc = Hpricot.parse(File.read(docs_filename))
      @chapters = @doc.search("//chapter").map {|e|
        Chapter.new(e, @base)
      }
      @refe = build_reference_index
    end

    def refe(key)
      case key
      when Hash
        raise "Error, refe(:key => value): #{key.inspect}" if key.size != 1
        k, v = key.to_a[0]
        @refe[k.intern][v]
      when String
        @refe.keys.each do |k|
          v = @refe[k][key]
          return v if v
        end
      else
        raise "Error, refe: #{key.inspect}"
      end
    end

    def build_reference_index
      r = Hash.new{|h,k| h[k] = {} }
      @chapters.each do |chap|
        chap.references.each do |ref|
          ref.sections.each do |sec|
            r[:id][sec.section_id] = sec.definition
            r[sec.role.intern][sec.definition.name] = sec.definition if sec.definition
          end
        end
      end
      r
    end

    def docs_filename
      File.join(@base, "cairo-docs.xml")
    end
  end

  class Chapter
    attr_reader :title, :references

    def initialize(doc, base)
      @doc = doc
      @base = base
      @title = doc["id"]
      @references = include_files.map{|e|
        ReferenceDocument.new(Hpricot.parse(File.read(File.join(@base, e))))
      }
    end

    def include_files
      @doc.search("xi:include").map {|e|
        e["href"]
      }
    end
  end

  class ReferenceDocument
    attr_reader :entry_id, :title, :uri, :sections

    def initialize(doc)
      @doc = doc
      @entry_id = @doc.at("refentry")["id"]
      @title = @doc.at("refentrytitle").inner_text
      @uri = "http://www.cairographics.org/manual/#{@entry_id}.html"
      @sections = @doc.search("//refsect1[@role='details']/refsect2").map {|e|
        ReferenceSection.new(e, @uri)
      }
    end

    def functions
      self.sections.find_all{|e| e.role == "function" }
    end

    def enums
      self.sections.find_all{|e| e.role == "enum" }
    end

    def structs
      self.sections.find_all{|e| e.role == "struct" }
    end

    def unions
      self.sections.find_all{|e| e.role == "union" }
    end

    def typedefs
      self.sections.find_all{|e| e.role == "typedef" }
    end

    def datatypes
      self.sections.find_all{|e| %W(enum struct union).include?(e.role) }
    end
  end

  class ReferenceSection
    attr_reader :section_id, :role, :uri, :definition

    def initialize(doc, parent_uri)
      @doc = doc
      anc = doc.at("title/anchor")
      if anc
        # 1.6
        @section_id = anc["id"]
        @role = anc["role"]
      else
        # 1.8
        @section_id = doc["id"]
        @role = doc["role"]
      end
      @uri = "#{parent_uri}##{@section_id}"
      if @role == "function"
        @definition = function_definition
      else
        @definition = datatype_definition
      end
    end

    def datatype_definition
      DataType.parse(self.role, programlisting)
    end

    def function_definition
      Function.parse(programlisting)
    end

    def programlisting
      @doc.at("programlisting").inner_text
    end

    def primary
      @doc.at("indexterm/primary").inner_text
    end
  end

  module Util
    module_function
    def remove_comment(v)
      v.gsub(/\/\*.*?\*\//m, "")
    end
  end

  class Function
    class IllegalFunctionDefinitionError < StandardError; end

    FUNC_RE = %r{
      ^
      ((?:[\*\w]+\s+)+)
      (\w+|\(\*\w+\))\s*
      \((.*?)\);
      \s*$
    }mx

    attr_reader :return_type, :name, :args

    def self.parse(body)
      raise IllegalFunctionDefinitionError, body unless Util.remove_comment(body) =~ FUNC_RE
      ret, func, args = $~.captures
      self.new(ret.strip,
               func.strip,
               args.scan(/((?:[^,\(]+|\(.*?\))+),?/m).flatten.map{|e| e.strip})
    end

    def initialize(ret, name, args)
      @return_type = ret
      @name = name
      @args = args
    end

    def definition
      [@return_type, @name, @args]
    end
    alias to_a definition

    def callback_entry?
      @name =~ /\A\(\*/
    end
  end

  class DataType
    class IllegalDataTypeDefinitionError < StandardError; end

    BLOCK_RE = %r{
      ^
      [^{}]+
      \{
        ([^{}]+)
      \}
      \s*
      (\w+)
      \s*;$
    }mx

    TYPEDEF_RE = %r{
      ^
      typedef \s*
      ((?:\w+\s+)+) \s*
      (\w+)
      ;$
    }mx

    attr_reader :type, :name, :body

    def self.parse(role, body)
      m = "parse_#{role}"
      unless self.respond_to?(m)
        warn "unsupported role '#{role}': #{body}"
        return
      end
      self.__send__(m, Util.remove_comment(body))
    end

    def self.parse_typedef(body)
      raise IllegalDataTypeDefinitionError, body unless body =~ TYPEDEF_RE
      type, name = $~.captures.map{|e| e.strip }
      self.new(:typedef, name, type)
    end

    def self.parse_struct(body)
      raise IllegalFunctionDefinitionError, body unless body =~ BLOCK_RE
      body, name = $~.captures.map{|e| e.strip }
      body = body.split(/\s*;\s*/).map{|type_name|
        if type_name =~ /,/
          names = type_name.split(/\s*,\s*/)
          t = names[0][/\A(.+?)\w+\z/, 1]
          [names[0]] + names[1..-1].map{|e| "#{t} #{e}" }
        else
          type_name
        end
      }.flatten
      self.new(:struct, name, body)
    end

    def self.parse_enum(body)
      raise IllegalFunctionDefinitionError, body unless body =~ BLOCK_RE
      body, name = $~.captures.map{|e| e.strip }
      body = body.split(/\s*,\s*/).map{|const|
        if const =~ /(\w+)\s*=\s*((?:0x)?[\da-fA-F]+)/
          [$1, $2]
        else
          [const, nil]
        end
      }
      self.new(:enum, name, body)
    end

    def initialize(type, name, body)
      @type = type
      @name = name
      @body = body
    end

    def definition
      [@type, @name, @body]
    end
    alias to_a definition
  end
end


if $0 == __FILE__
  require "optparse"

  roles = %W(typedef enum union struct function).map{|e| e.intern }

  opt = roles.inject({}){|h,k| h[k] = nil; h }
  ARGV.options do |o|
    o.banner = "Usage: #{$0} PATH_TO_CAIRO_XMLDOC"
    o.on("-t", "Enable typedef"){ opt[:typedef] = true }
    o.on("-e", "Enable enum"){ opt[:enum] = true }
    o.on("-u", "Enable union"){ opt[:union] = true }
    o.on("-s", "Enable struct"){ opt[:struct] = true }
    o.on("-f", "Enable function"){ opt[:function] = true }
    o.on("-T", "Disable typedef"){ opt[:typedef] = false }
    o.on("-E", "Disable enum"){ opt[:enum] = false }
    o.on("-U", "Disable union"){ opt[:union] = false }
    o.on("-S", "Disable struct"){ opt[:struct] = false }
    o.on("-F", "Disable function"){ opt[:function] = false }
    o.parse!
  end
  if opt.values.all?{|e| e.nil? }
    opt.keys.each{|k| opt[k] = true }
  end

  if ARGV.empty?
    ARGV.options.parse("-h")
    exit 2
  end

  docdir = ARGV.shift
  doc = CairoDocument::Book.new(docdir)
  doc.chapters.each do |chap|
    chap.references.each do |ref|
      targets = roles.find_all{|e| opt[e] }.map{|e| [e, ref.__send__("#{e}s")]}.reject {|e| e[1].empty? }
      next if targets.empty?

      puts
      puts "==== #{chap.title} - #{ref.title} ===="
      puts
      targets.each do |role, lst|
        puts
        puts "-- #{role} -----------"
        puts
        lst.each {|e|
#          p [*e.definition]
          puts e.programlisting
        }
      end
    end
  end
end
