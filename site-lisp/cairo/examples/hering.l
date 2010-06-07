;; cairo/cairo-demo/png/hering.c translated into xyzzy Lisp.

(load "_runner.l")

(do-snippets (:width 300 :height 600 :normalize nil)
  (let* ((lines 32)
         (max-theta (* 0.8 pi 2))
         (theat-inc (/ (* 2.0 max-theta) (- lines 1))))
    (cairo-set-source-rgb cr 0 0 0)
    (cairo-set-line-width cr 2.0)

    (with-cairo-save (cr)
      (cairo-translate cr (/ width 2) (/ height 2))
      (cairo-rotate cr max-theta)

      (dotimes (i lines)
        (cairo-move-to cr (* -2.0 width) 0)
        (cairo-line-to cr (* 2.0 width) 0)
        (cairo-stroke cr)

        (cairo-rotate cr (- theat-inc))))

    (cairo-set-line-width cr 6)
    (cairo-set-source-rgb cr 1 0 0)

    (cairo-move-to cr (* width 1/4) 0)
    (cairo-rel-line-to cr 0 height)
    (cairo-stroke cr)

    (cairo-move-to cr (* width 3/4) 0)
    (cairo-rel-line-to cr 0 height)
    (cairo-stroke cr)))
