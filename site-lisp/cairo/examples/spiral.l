;; cairo/cairo-demo/png/spiral.c translated into xyzzy Lisp.

(load "_runner.l")

(do-snippets (:width 600 :height 600 :normalize nil)
  (let ((wd (* 0.02 width))
        (hd (* 0.02 height)))
    (decf width 2)
    (decf height 2)
    (cairo-move-to cr (+ width 1) (- 1 hd))
    (dotimes (i 25)
      (cairo-rel-line-to cr 0 (- height (* hd (- (* 2 i) 1))))
      (cairo-rel-line-to cr (- (- width (* wd 2 i))) 0)
      (cairo-rel-line-to cr 0 (- (- height (* hd 2 i))))
      (cairo-rel-line-to cr (- width (* wd (+ (* 2 i) 1))) 0))
    (cairo-set-source-rgb cr 0 0 1)
    (cairo-stroke cr)))
