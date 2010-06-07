= xycairo examples

== 概要

* ext- で始まるファイルは cairo.ext パッケージの API のサンプルです。
  * ext-circle.l: 真円を描画するサンプル
  * ext-heart.l: ハートを描画するサンプル
  * ext-star.l: 星を描画するサンプル
  * ext-triangle.l: 三角形を描画するサンプル
  * ext-polygon.l: 多角形を描画するサンプル
  * ext-rounded-rectangle.l: 角丸四角を描画するサンプル
  * ext-rounded-rectangle-complex.l: 角丸四角を描画するサンプル

* show-glyphs-select-font.l を動かすには commdlg が必要です。
  commdlg は NetInstaller でインストール可能です。

* drive-info.l はディスク使用量を円グラフで描画するサンプルです。
  dirve-info が別途必要です (NetInstaller でインストール可能)。

* pie-chart.l は円グラフを描画するサンプルです。

* lisp-2.0.l は某 CM 風のバナーを作成するサンプルです。

* text-postscript.l は text.l の PostScript 版です。

* text-japanese-pdf.l は text-japanese.l の PDF 版です。

* imagepattern-png-stream.l は PNG の stream API のサンプルです。


* show-glyphs.l は PyCairo に付属の snippets/show_glyphs.py の移植です。

* hears.l と lissajous-curves.l は cl-cairo2 の example の移植です。

* 上記以外のスクリプトは以下の examples の移植です。
  http://cairographics.org/samples/index.html

== 動かし方

- _runner.l を eval-buffer して M-x run-all-snippets
  ですべての example を実行できます。

- xxx.l を eval-buffer または load-file することで、
  その example だけ実行できます。

- run-current-snippet-and-view で開いている example を実行し
  出力結果を関連付けられたアプリで表示します。

実行結果は examples/ ディレクトリに png ファイルとして保存されます。
実行結果を削除したい場合は M-x clean-all-snippet-outputs を実行します。
