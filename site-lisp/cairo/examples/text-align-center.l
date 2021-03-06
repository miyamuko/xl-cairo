(load "_runner.l")
(do-snippets ()
  (let ((utf8 "cairo"))
    (cairo-select-font-face cr "Sans" :normal :normal)
    (cairo-set-font-size cr 0.2)
    (multiple-value-bind (x-bearing y-bearing width height x-advance y-advance)
        (cairo-text-extents cr utf8)
      (let ((x (- 0.5 (+ (/ width 2) x-bearing)))
            (y (- 0.5 (+ (/ height 2) y-bearing))))
        (cairo-move-to cr x y)
        (cairo-show-text cr utf8)

        ;; draw helping lines
        (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
        (cairo-arc cr x y 0.05 0 (* 2 pi))
        (cairo-fill cr)
        (cairo-move-to cr 0.5 0)
        (cairo-rel-line-to cr 0 1)
        (cairo-move-to cr 0 0.5)
        (cairo-rel-line-to cr 1 0)
        (cairo-stroke cr)))))
