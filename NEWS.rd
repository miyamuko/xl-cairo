=begin

=== 2009-07-02 / 1.8.0

xl-cairo 1.8.0 リリース!

: 新規機能

    * 添付している cairo を ((<"1.8.8"|URL:http://cairographics.org/news/cairo-1.8.8/>)) に更新。
    * cairo 1.8 で追加された関数を定義
      * cairo-scaled-font-get-scale-matrix
      * cairo-scaled-font-text-to-glyphs
      * cairo-show-text-glyphs
      * cairo-surface-get-fallback-resolution
      * cairo-surface-has-show-text-glyphs
      * cairo-toy-font-face-create
      * cairo-toy-font-face-get-family
      * cairo-toy-font-face-get-slant
      * cairo-toy-font-face-get-weight
      * ※ユーザフォントはサポートしていません
    * cairo 1.8 で追加された error-status に対応する例外クラスを定義

: 非互換を含む変更点

    * なし

: バグ修正

    * 名前を xycairo から xl-cairo にした。

    * cairo 1.6 で追加された error-status に対応する例外クラスを忘れていたのを修正

: その他

    * なし


=== 2008-04-14 / 1.6.0

xycairo 1.6.0 リリース!

: 新規機能

    * 添付している cairo を ((<"1.6.4"|URL:http://cairographics.org/news/cairo-1.6.4/>)) に更新。
    * cairo 1.6 で追加された関数を定義
      * cairo-win32-font-face-create-for-logfontw-hfont
      * cairo-has-current-point
      * cairo-path-extents
      * cairo-path-extents-list
      * cairo-path-extents-alist
      * cairo-format-stride-for-width
      * cairo-win32-printing-surface-create
      * cairo-ps-surface-restrict-to-level
      * cairo-ps-get-levels
      * cairo-ps-level-to-string
      * cairo-ps-surface-set-eps
      * cairo-ps-surface-get-eps
      * cairo-surface-copy-page
      * cairo-surface-show-page

=== 2008-01-21 / 0.0.8

xycairo 0.0.8 リリース!

: 新規機能

    * 添付している cairo を ((<"1.4.14"|URL:http://cairographics.org/news/cairo-1.4.14/>)) に更新。


=== 2007-12-01 / 0.0.7

xycairo 0.0.7 リリース!

: 新規機能

    * 添付している cairo を ((<"1.4.12"|URL:http://cairographics.org/news/cairo-1.4.12/>)) に更新。


=== 2007-09-30 / 0.0.6

xycairo 0.0.6 リリース!

: 新規機能

    * 添付している cairo を ((<"1.4.10"|URL:http://cairographics.org/news/cairo-1.4.10/>)) に更新。

    * cairo.ext パッケージに以下の API を追加
      * (cairo-circle): 真円を描く API
      * (cairo-polyline): 多線形を描く API
      * (cairo-polygon): 多角形を描く API
      * (cairo-regular-polygon): 正多角形を描く API
      * (cairo-triangle): 三角形を描く API
      * (cairo-heart): ハートを描く関数
      * (cairo-star): 星を描く関数
      * (cairo-rounded-rectangle): 角丸の四角を描く API (rcairo 互換)
      * (cairo-rounded-rectangle-complex): 角丸の四角を描く API その２
      * (cairo-map-path-onto): 現在のパスを指定したパス上に配置する
      * (radian->degree, degree->radian): 弧度法と角度の変換関数

: 非互換を含む変更点

    * なし

: バグ修正

    * cairo-show-text に nil を指定するとキーボードから文字列を読み込もうとしてしまう
      問題を修正。nil は空文字列と同じ扱いにした。

    * (cairo-get-dash): メモリ破壊が起きていた問題を修正。

: その他

    * 以下のサンプルを追加。
      * (examples/ext-circle.l): 真円を描くサンプル (cairo.ext:cairo-circle)
      * (examples/ext-triangle.l): 三角形を描くサンプル (cairo.ext:cairo-trianble)
      * (examples/ext-polygon.l): 正多角形を描くサンプル (cairo.ext:cairo-regular-polygon)
      * (examples/ext-heart.l): ハートを描くサンプル (cairo.ext:cairo-heart)
      * (examples/ext-star.l): 星を描くサンプル (cairo.ext:cairo-star)
      * (examples/ext-rounded-rectangle.l): 角丸の四角を描くサンプル (cairo.ext:cairo-rounded-rectangle)
      * (examples/ext-rounded-rectangle-complex.l): 角丸の四角を描くサンプル (cairo.ext:cairo-rounded-rectangle-complex)
      * (examples/text-on-path.l): パス上にテキストを配置するサンプル (cairo.ext:cairo-map-path-onto, rcairo の sample の移植)
    * (examples/hearts.l): cairo.ext:cairo-heart を使って再実装。
    * (do-snippets): 実行時間を画像の左下に表示するようにした。


=== 2007-06-10 / 0.0.5

xycairo 0.0.5 リリース!

: 新規機能

    * 添付している cairo を ((<"1.4.8"|URL:http://cairographics.org/news/cairo-1.4.8/>)) に更新。

    * PDF surfaces と PostScript surface をサポート。
      PDF/PostScript を作成できます。

        (with-cairo-surface (surface (cairo-pdf-surface-create "output.pdf" 200 200))
          (with-cairo (cr (cairo-create surface))
            ...))

        (with-cairo-surface (surface (cairo-ps-surface-create "output.ps" 200 200))
          (with-cairo (cr (cairo-create surface))
            ...))

    * stream API をサポート。

      cairo-image-surface-create-from-png と cairo-surface-write-to-png が
      ストリームを引数に取ることができるようになりました。

      従来どおりファイル名を引数に指定することも可能です

        (with-open-file (in "input.png" :direction :input)
          (with-open-file (out "output.png"
                               :direction :output
                               :if-exists :supersede
                               :if-does-not-exist :create)
            (with-cairo-surface (image (cairo-image-surface-create-from-png in))
              (with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
                (with-cairo (cr (cairo-create surface))
                  (with-output-to-png (surface out)
                    ...))))))

    * with-output-to-png マクロを追加。

        (with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
          (with-cairo (cr (cairo-create surface))
            (with-output-to-png (surface "output.png")
              ...)))

: 非互換を含む変更点

    * cairo-*-destroy はやっぱり export するようにした。

: バグ修正

    * なし

: その他

    * アプリとライブラリの依存度を下げるために、with-xxx マクロの本体を
      call-with-xxx 関数内で実装するようにしました。

      ((<"Why I Like CALL-WITH-* Style In Macros"|URL:http://random-state.net/log/3390120648.html>))
      を参考にしました。

    * 以下のサンプルを追加。

      * (examples/text-postscript.l): text.l の PostScript 版
      * (examples/text-japanese-pdf.l): text-japanese.l の PDF 版
      * (examples/imagepattern-png-stream.l): PNG の stream API のサンプル
      * (examples/lissajous-curves.l): リサージュ曲線を描くサンプル (stolen from cl-cairo2)
      * (examples/hearts.l): ハートをランダムに描くサンプル (stolen from cl-cairo2)


=== 2007-06-04 / 0.0.4

xycairo 0.0.4 リリース!

: 新規機能

    * with- 系マクロを追加 (cairo package)

      * with-cairo
      * with-cairo-path
      * with-cairo-pattern
      * with-cairo-font-face
      * with-cairo-font-options
      * with-cairo-scaled-font
      * with-cairo-surface

      * with-cairo-save
      * with-cairo-fill
      * with-cairo-fill-preserve
      * with-cairo-stroke
      * with-cairo-stroke-preserve
      * with-cairo-group

    * cairo-push-group が optional な content 引数を取るようにしました。
      (cairo-push-group-with-content との統合)

    * cairo-pop-group が optional な to-source 引数を取るようにしました。
      (cairo-pop-group-to-source との統合)

    * xxx-extents を list で返す関数を追加。

      * cairo-clip-extents-list
      * cairo-fill-extents-list
      * cairo-stroke-extents-list
      * cairo-font-extents-list
      * cairo-text-extents-list
      * cairo-glyph-extents-list
      * cairo-scaled-font-extents-list
      * cairo-scaled-font-text-extents-list
      * cairo-scaled-font-glyph-extents-list

    * cairo パッケージの nicknames に cairo.api を設定

: 非互換を含む変更点

    * 以下の関数を export しないようにしました。

      * cairo-push-group-with-content
      * cairo-pop-group-to-source
      * cairo-pattern-get-color-stop-count
      * cairo-pattern-get-color-stop-rgba

      * cairo-*-destroy
      * cairo-*-reference
      * cairo-*-get-reference
      * cairo-*-status

: バグ修正

      * cairo-clip-rectangle-list が動かなくなっていたのを修正。

: その他

    * 以下のサンプルを追加。

      * (examples/drive-info.l): drive-info を使って空き容量をグラフ表示するサンプル。


=== 2007-05-27 / 0.0.3

xycairo 0.0.3 リリース!

: 新規機能

    * cairo.ext パッケージを追加。

      純粋な cairo API のバインディングではない独自拡張は
      cairo.ext パッケージ内に定義します。

    * 最低限の with- 系マクロを追加 (cairo.ext)

      * with-cairo
      * with-cairo-surface

      例:

        (require "cairo")
        (use-package :cairo)
        (use-package :cairo.ext)  ;; これが必要

        (with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
          (with-cairo (cr (cairo-create surface))
            ;; do something
            ))

    * win32 フォント (LOGFONTW) 作成ユーティリティを追加 (cairo.ext)。

      0.0.2 で追加した create-logfontw は利用せず
      cairo-win32-font-face-create を使用してください。

        (cairo-set-font-face cr (cairo-win32-font-face-create "ＭＳ ゴシック" :bold t))

    * xxx-extents を alist で返す関数を追加。

      * cairo-scaled-font-extents-alist
      * cairo-scaled-font-text-extents-alist
      * cairo-scaled-font-glyph-extents-alist

      * cairo-font-extents-alist
      * cairo-text-extents-alist
      * cairo-glyph-extents-alist

      * cairo-clip-extents-alist
      * cairo-fill-extents-alist
      * cairo-stroke-extents-alist

: 非互換を含む変更点

    * cairo-path-list は cairo::context 構造体を引数に取るようになりました。

        (cairo-path-list cr)

    * 階層化されたパッケージ名の区切りを - から . にしました。

      * cairo-ffi → cairo.ffi
      * cairo-util → cairo.util
      * cairo-ext → cairo.ext

    * 構造体名を export しないようにしました。

    * create-logfontw を cairo.ext パッケージに移動しました。

      cairo-win32-font-face-create があれば create-logfont は不要だと思うので
      export するのをやめた。

    * 以下の関数は構造体ではなく多値を返すようになりました。

      * cairo-scaled-font-extents
      * cairo-scaled-font-text-extents
      * cairo-scaled-font-glyph-extents

      * cairo-font-extents
      * cairo-text-extents
      * cairo-glyph-extents

: バグ修正

    * destroy したオブジェクトに対して xxx-get-reference-count を呼んでいたため
      クラッシュする場合があったのを修正しました。

: その他

    * 以下のサンプルを追加。

      * (examples/polygon.l): 多角形を描画するサンプル
      * (examples/pie-chart.l): 円グラフを描画するサンプル
      * (examples/lisp-2.0.l): 某 CM 風のバナーを作成するサンプル


=== 2007-05-13 / 0.0.2

xycairo 0.0.2 リリース!

: 新規機能

    * LOGFONTW を作成するための create-logfontw 関数を追加。

          (cairo-set-font-face cr (cairo-win32-font-face-create-for-logfontw
                                   (create-logfontw "ＭＳ ゴシック")))

      examples/show-glyphs-select-font.l, text-japanese.l を参考にしてください。

: 非互換を含む変更点

    * なし

: バグ修正

    * cairo-show-glyphs に複数の glyph を渡した場合にうまく描画されない問題を回避。

    * cairo-reload-dll がただしく再ロードできていなかった問題を修正。

    * examples/ 配下のスクリプトを eval-buffer で実行すると $XYZZYHOME/lisp/startup.lc
      が png ファイルで上書きされてしまっていた問題を修正。

      以下の該当する方はお手数ですが startup.lc の復旧をお願いします。

      * 該当者:

        examples/ 配下のスクリプトを eval-buffer で実行した人は
        $XYZZYHOME/lisp/startup.lc の日付や内容を確認してください。

        更新した覚えがないのに startup.lc の日付が新しい場合や、
        拡張子を png に変えて画像ビューアで表示できる人が該当します。

      * 症状:

        ダンプファイルを消して xyzzy を起動すると起動に失敗します。

      * 修正方法:

        (1) startup.lc を削除して xyzzy を起動してください。
        (2) 起動後、M-x byte-compile-file を実行し $XYZZYHOME/lisp/startup.l
            をバイトコンパイルしてください。

: その他

    * xyzzy/cairo は長いので xycairo に変更。


=== 2007-05-07 / 0.0.1

xycairo 0.0.1 リリース!


=end
