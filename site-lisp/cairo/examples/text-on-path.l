;;;;
;;;; text-on-path.l - パス上にテキストを配置するサンプル
;;;;
;;;; rcairo の sample の移植。
;;;; http://webcvs.cairographics.org/rcairo/samples/text-on-path.rb?view=markup
;;;;

(load "_runner.l")

(do-snippets (:normalize nil :width 500 :height 500)
  (let ((text "It was a dream... Oh Just a dream..."))
    ;; 曲線を描く
    (with-cairo-stroke-preserve (cr)
      (cairo-move-to cr 25 350)
      (cairo-line-to cr 150 375)
      (cairo-curve-to cr 275 400 450 350 450 200)
      (cairo-curve-to cr 450 0 300 150 50 50))
    ;; 曲線のパスを保存
    (let ((path (cairo-path-list-flat cr)))
      ;; パスをクリア
      (cairo-new-path cr)
      ;; テキストのパスを作成
      (cairo-set-line-width cr 1)
      (cairo-select-font-face cr "Serif" :normal :normal)
      (cairo-set-font-size cr 36)
      (cairo-text-path cr text)
      ;; 現在の context 上のパス (= テキストのパス) を path 上に変換する
      (cairo-map-path-onto cr path)
      ;; テキストを描画
      (cairo-set-source-rgba cr 0.3 0.3 1.0 0.3)
      (cairo-fill-preserve cr)
      (cairo-set-source-rgb cr 0.1 0.1 0.1)
      (cairo-stroke cr))))
