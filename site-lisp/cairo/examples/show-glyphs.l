(load "_runner.l")
(do-snippets ()
  (cairo-select-font-face cr "Sans" :normal :normal)
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
