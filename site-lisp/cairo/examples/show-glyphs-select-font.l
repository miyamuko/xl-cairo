(handler-case
    (require "winapi/commdlg")
  (error (e)
    (msgbox "examples/show-glyphs-select-font.l を動かすには commdlg が必要です。~%NetInstaller でインストールできます。")
    (error e)))

(load "_runner.l")
(do-snippets (:width 800 :height 800)
  (let ((face (win-user::choose-font-dialog :face-name "ＭＳ ゴシック")))
    (with-cairo-font-face (face (cairo-win32-font-face-create (cadr (member :face-name face))))
      (cairo-set-font-face cr face)))
  ;; draw 0.08 glyphs in 0.10 squares at 0.01 0.02) from left corner
  (cairo-set-font-size cr 0.08)
  (let ((index 0)
        (glyphs))
    (dotimes (y 10)
      (dotimes (x 10)
        (push (make-glyph :index index
                          :x (+ (/ x 10.0) 0.01)
                          :y (+ (/ y 10.0) 0.08))
              glyphs)
        (incf index)))
    (cairo-show-glyphs cr (reverse glyphs))))
