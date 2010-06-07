require "cairodoc"

class String
  def compact
    self.gsub(/\s+/, " ").strip
  end
end


module Transformer

  module Xyzzy

    module Foreign
      C_TYPES = %W{
        void char short int long u_char u_short u_int u_long float double
        wchar_t size_t time_t ptrdiff_t clock_t off_t
        void* char* string
      }

      WINAPI_TYPES = %W{
        HFONT HDC
      }
    end

    module NameUtil
      include Foreign

      def api_func_name(name)
        name.strip.gsub(/_/, "-")
      end

      def ffi_func_name(name)
        "%" + api_func_name(name)
      end

      def lisp_name(n)
        n = n.strip
        n.gsub!(/\Acairo_(.+_t)\b/) { $1 }
        n.gsub!(/_/, "-")
        n
      end

      def lisp_enum_const(enum, const)
        const = const.downcase
        r = enum.split(/_/).inject(const) do |c, prefix|
          c.sub!(/\A#{prefix}_/, "") or break c
          c
        end
        ":#{lisp_name(r)}"
      end

      def lisp_value(v)
        v = v.strip
        v.gsub!(/^0x/, "#x")
        v
      end

      def lisp_type(t, pkg = "cairo.ffi")
        t = t.strip
        t.gsub!(/enum/, "")
        t.gsub!(/const/, "")
        t.strip!
        t = lisp_name(t)
        t.gsub!(/unsigned\s+/, "u_")
        t.gsub!(/\s+/, "")
        if C_TYPES.include?(t)
          "c:#{t}"
        elsif WINAPI_TYPES.include?(t)
          "winapi:#{t}"
        elsif pkg != "cairo.ffi"
          "cairo.ffi:#{t}"
        else
          t
        end
      end

      def lisp_args(args, pkg = "cairo.ffi")
        r = []
        args.flatten.each do |e|
          case e
          when "void"
          when "..."
            r << ["#| TODO ... |#"]
          when /\A(.+?)(\w+)\z/
            t, n = $1, $2
            r << [lisp_type(t, pkg), lisp_name((n || t).strip)]
          else
            raise e
          end
        end
        r
      end
    end

    class LispFFI
      include NameUtil

      def generate_datatype(type, name, body)
        self.__send__("generate_#{type}", name, body)
      end

      def generate_typedef(name, body)
        lname = lisp_name(name)
        if body =~ /struct/
          "(define-c-private-struct-with-ptr #{lname})\n"
        else
          lalias = lisp_type(body.strip)
          "(c:*define-c-type #{lalias} #{lname})\n"
        end
      end

      def generate_enum(name, body)
        lname = lisp_name(name)
        nmax = body.map{|n,v| n.length }.max
        lnmax = body.map{|n,v| lisp_enum_const(name, n).length }.max
        lbody = body.map{|n,v|
          vs = [n, lisp_enum_const(name, n)]
          if v
            "(%-#{nmax}s %-#{lnmax}s %s)" % (vs + [lisp_value(v)])
          else
            "(%-#{nmax}s %s)" % vs
          end
        }
        return <<-END
(define-c-enum-with-ptr #{lname}
  #{lbody.join("\n" + " " * 2)})
        END
      end

      def generate_struct(name, body)
        lname = lisp_name(name)
        lbody = body.map{|e|
          t, n = e.scan(/\A(.+?)(\w+)\z/)[0]
          "(#{lisp_type(t)} #{lisp_name(n)})"
        }
        return <<-END
(define-c-struct-with-ptr #{lname}
  #{lbody.join("\n" + " " * 2)})
        END
      end

      def generate_function(ret, func, args)
        if func =~ /\A\(\*(\w+)\)/
          macro = "define-callback-function"
          lname = lisp_name($1)
        else
          macro = "define-cairo-api"
          lname = ffi_func_name(func.strip)
        end
        lret = lisp_type(ret)
        largs = lisp_args(args).map{|e| "(#{e * ' '})" }
        r = <<-END
(#{macro}
  #{lret}
  #{lname} (#{largs.join("\n" + " " * (4 + lname.length))}))
        END

        if %W(c:double c:float).include?(lret)
          lname << "2"
          largs << "(#{lret.sub(/^c:/, '')}* out)"
          lret = "c:void"
          r << <<-END

(#{macro}
  #{lret}
  #{lname} (#{largs.join("\n" + " " * (4 + lname.length))}))
          END
        end
        r
      end
    end

    class LispAPI
      include NameUtil

      def generate_function(ret, func, args)
        fname = ffi_func_name(func.strip)
        fret = lisp_type(ret, "cairo")
        fargs = lisp_args(args, "cairo")
        lname = api_func_name(func.strip)
        largs = fargs.map{|e| e[1] }.join(" ")
        ltypes = fargs.map{|e| e[0] }.join(" ")
        largs_with_type = fargs.map{|e| "(#{e * ' '})" }

        if largs.empty?
          return <<-END
(defun #{lname} ()
  (returning (#{fret})
    (#{fname})))
          END
        else
          return <<-END
(defun #{lname} (#{largs})
  (returning (#{fret})
    (with-c-arguments (#{largs_with_type.join("\n" + " " * 23)})
      (#{fname} #{largs}))))
          END
        end
      end
    end
  end
end

if $0 == __FILE__
  require "erb"
  require "optparse"
  require "fileutils"

  docdir = "../cairo-1.4.6/doc/public/"
  ffidir = "../../ffi"
  apidir = "../../api"
  tmpldir = "./templates"

  targets = %W(ffi api).map{|e| e.intern }
  generate = targets.inject({}){|h,k| h[k] = nil; h }

  ARGV.options do |opt|
    opt.on("-d CAIRO_DOCDIR"){|v| docdir = v}
    opt.on("-a API_OUTDIR"){|v| apidir = v}
    opt.on("-f FFI_OUTDIR"){|v| ffidir = v}
    opt.on("-t TEMPLATEDIR"){|v| tmpldir = v}
    opt.on("--ffi"){|v| generate[:ffi] = true }
    opt.on("--api"){|v| generate[:api] = true }
    opt.parse!
  end
  if targets.all?{|e| not generate[e] }
    targets.each{|e| generate[e] = true }
  end

  IGNORE = %W{
    # 1.6
    fonts/freetype-fonts
    fonts/quartz-fonts
    surfaces/xlib-surfaces

    # 1.8
    fonts/ft-font
    fonts/quartz-font
    surfaces/quartz-surface
    surfaces/xlib-surface
  }

  META_AUTOGEN = /@auto-generate: (\w+)/

  HANDMADE_RE = %r{
    (
    ^;;;;\ handmade\ section
    .+?
    )
    ^\(provide
  }xm

  ffi_type_tmpl = ERB.new(File.read(File.join(tmpldir, "types.erb")), 0, "<>%")
  ffi_func_tmpl = ERB.new(File.read(File.join(tmpldir, "function.erb")), 0, "<>%")
  api_func_tmpl = ERB.new(File.read(File.join(tmpldir, "api.erb")), 0, "<>%")

  scan_meta_autogen = lambda{|outfile|
    return [:full, nil] unless File.exist?(outfile)
    c = File.read(outfile)
    meta = (c[META_AUTOGEN, 1] || "full").intern
    r = c[HANDMADE_RE, 1]
    r = r.strip unless r.nil?
    [meta, r]
  }

  output_names = lambda{|path, name|
    outname = File.join(path, name).downcase
    outfile = outname + ".l"
    [outfile, outname]
  }

  generate_script = lambda{|outdir, outfile, outname, tmpl, b|
    target = File.join(outdir, outfile)
    FileUtils.mkdir_p File.dirname(target)

    autogen_flag, handmade = scan_meta_autogen.call(target)
    target += ".new" unless [:full, :merge].include?(autogen_flag)

    eval("handmade = #{handmade.inspect}", b)
    eval("autogen_flag = #{autogen_flag.inspect}", b)
    r = tmpl.result(b)

    if r.strip != ""
      p [autogen_flag, target]
      open(target, "w"){|w| w.puts r }
    end
  }

  generate_type_script = lambda{|role, depends|
    outfile, outname = output_names.call("types", role.to_s)
    datatype = role
    generate_script.call(ffidir, outfile, outname, ffi_type_tmpl, binding)
  }

  ffi_gen = Transformer::Xyzzy::LispFFI.new
  api_gen = Transformer::Xyzzy::LispAPI.new
  doc = CairoDocument::Book.new(docdir)

  # generate ffi/types/*.l
  if generate[:ffi]
    generate_type_script.call(:typedef, [])
    generate_type_script.call(:enum, [])
    generate_type_script.call(:struct, [:enum, :union])
  end

  # generate ffi/*/*.l and api/*/*.l
  doc.chapters.each do |chap|
    path = chap.title.downcase.sub(/^cairo-/, "")
    chap.references.each do |ref|
      outfile, outname = output_names.call(path, ref.entry_id.sub(/^cairo-/, ""))
      next if IGNORE.include?(outname)

      if generate[:ffi]
        generate_script.call(ffidir, outfile, outname, ffi_func_tmpl, binding)
      end
      if generate[:api]
        generate_script.call(apidir, outfile, outname, api_func_tmpl, binding)
      end
    end
  end
end
