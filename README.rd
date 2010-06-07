= xl-cairo - cairo を利用した 2D グラフィックライブラリ

  * Author: みやむこ かつゆき ((<URL:mailto:miyamuko@gmail.com>))
  * Home URL: ((<URL:http://miyamuko.s56.xrea.com/xyzzy/cairo/intro.htm>))
  * Version: 1.8.0


== NAME

xl-cairo - cairo を利用した 2D グラフィックライブラリ


== SYNOPSIS

  (require "cairo")
  (use-package :cairo)
  (use-package :cairo.ext)

  (let ((width 300)
        (height 200))
    (with-cairo-surface (surface (cairo-image-surface-create :argb32 width height))
      (with-cairo (cr (cairo-create surface))
        (with-output-to-png (surface (merge-pathnames "test.png" (get-special-folder-location :desktop)))
          (cairo-set-line-width cr 0.04)
          (cairo-scale cr width height)
          (cairo-move-to cr 0.5 0.1)
          (cairo-line-to cr 0.9 0.9)
          (cairo-rel-line-to cr -0.4 0.0)
          (cairo-curve-to cr 0.2 0.9 0.2 0.5 0.5 0.5)
          (cairo-close-path cr)
          (cairo-set-source-rgb cr 0 0 1)
          (cairo-fill-preserve cr)
          (cairo-set-source-rgb cr 0 0 0)
          (cairo-stroke cr)))))


== DESCRIPTION

xl-cairo は 2D グラフィックライブラリである
((<"cairo"|URL:http://cairographics.org/>))
を xyzzy から利用するためのライブラリです。

cairo はデバイスに依存しないベクトルベースの API を提供しています。
xl-cairo ではそのうち以下のバックエンドをサポートしています。

  * Windows のデバイスコンテキスト
  * ローカルなイメージバッファ
  * PNG
  * SVG
  * PDF
  * PostScript


== INSTALL

((<NetInstaller|URL:http://www7a.biglobe.ne.jp/~hat/xyzzy/ni.html>)) でインストールした場合は 3 以降を、
NetInstaller + ni-autoload を使っている人は 4 以降で OK です。

(1) アーカイブをダウンロードします。

    ((<URL:http://miyamuko.s56.xrea.com/xyzzy/archives/cairo.zip>))

(2) アーカイブを展開して、$XYZZY/site-lisp 配下にファイルをコピーします。

(3) xl-cairo はライブラリです。
    アプリケーションは以下のコードを追加することで cairo を利用することができます。

      (in-package :you-application-package)
      (require "cairo")
      (use-package :cairo)
      (use-package :cairo.ext)

    use-package するといくつかのシンボルがパッケージ修飾子なしで参照できるようになります。
    が、結構一般的な名前も使っているので、 editor や user では use-package せずに
    自分のアプリ専用のパッケージで use-package した方がいいでしょう。

    cairo.ext には純粋な cairo バインディングではない独自拡張を定義しています。


== MODULE

=== PACKAGE

cairo は以下のパッケージを利用しています。

  * cairo (nickname cairo.api)
  * cairo.ext
  * cairo.util
  * cairo.ffi


=== EXPORT

あとでかく。

=== VARIABLE

あとでかく。

=== COMMAND

あとでかく。

=== FUNCTION

((<"Cairo: A Vector Graphics Library"|URL:http://www.cairographics.org/manual/>))
と
((<"Rubyist Magazine - cairo: 2 次元画像描画ライブラリ"|URL:http://jp.rubyist.net/magazine/?0019-cairo>))
と
((<"rcairo のドキュメント"|URL:http://cairo.rubyforge.org/doc/ja/>))
を参照してください。

すいません。


== TODO

* This object is owned by cairo. To keep a reference to it, you must call cairo_font_face_reference. 
* cairo-font-options で alist で set/get
* destory で assert で落ちるのを cairo レベルでどうにかする。
* cairo-image-surface-create-for-data のテスト
* マクロ
  * short name/auto bind
  * do-tuples (from On Lisp)
* test, documents
* stdcall
* cairo-scaled-font-create の引数
* with-cairo-group のテスト
* with-cairo-fill, with-cairo-stroke で中で cairo-new-path すべきか?
  * rcairo はしている
  * 引数で制御できるようにする?
* surface を cairo-get-target したときなどに:
  * reference count は増やすべき?
  * 同じ lisp 構造体を返したほうがいいか? 一応 eq で比較できるし...
* win32-surface-create の統合?
* xxx-get-yyy, xxx-set-yyy を xxx-yyy のみにする。 set は setf で。
* cairo.ext
  * rcairo 拡張の取り込み
    * pseudo_blur
    * などなど
  * 他
    * 波形ジェネレータ (path で)
* cairo-show-text-glyphs, cairo-scaled-font-text-to-glyphs のテスト


== KNOWN BUGS

* ドキュメントがない


== AUTHOR

みやむこ かつゆき (((<URL:mailto:miyamuko (at) gmail.com>)))


== SEE ALSO

  : cairo
        ((<URL:http://cairographics.org/>))

  : Cairo: A Vector Graphics Library
        ((<URL:http://www.cairographics.org/manual/>))

  : Cairo samples
        ((<URL:http://cairographics.org/samples/>))

  : rcairo reference manual (日本語)
        ((<URL:http://cairo.rubyforge.org/doc/ja/>))

  : Rubyist Magazine - cairo: 2 次元画像描画ライブラリ
        ((<URL:http://jp.rubyist.net/magazine/?0019-cairo>))

  : cairo を使ったクロスプラットフォーム・グラフィックス
        ((<URL:http://www.ibm.com/developerworks/jp/linux/library/l-cairo/index.html>))

  : 第3章 核となる技術
        ((<URL:http://www.gnome.gr.jp/docs/g2-platform-overview/ch03.html#cairo>))

  : CLiki : cl-cairo2
        ((<URL:http://www.cliki.net/cl-cairo2>))

  : CLiki : cffi-cairo
        ((<URL:http://www.cliki.net/cffi-cairo>))

  : zlib Home Site
        ((<URL:http://www.zlib.net/>))

  : libpng Home Page
        ((<URL:http://www.libpng.org/pub/png/libpng.html>))


== COPYRIGHT

=== xl-cairo (this library)

xl-cairo は MIT/X ライセンスにしたがって利用可能です。

See cairo/docs/MIT-LICENSE for full license.

xl-cairo は以下のソフトウェアを含んでいます。
これらのソフトウェアのライセンスについては cairo/docs ディレクトリを参照してください。

  * cairo 1.8.8 + patch
  * libpng 1.2.8
  * zlib 1.2.3

==== cairo

xl-cairo は xyzzy のバグを回避するために、cairo 1.8.8 を修正して利用しています。

修正内容については cairo/src/patch/cairo-1.8.8-return-double.patch を参照してください。

See cairo/docs/cairo/COPYING for full license.

==== zlib

See cairo/docs/zlib/README.txt for full license.

==== libpng

See cairo/docs/libpng/LICENSE for full license.


== NEWS

<<<NEWS.rd

=end
