;;;;
;;;; cairo.ext:cairo-heart ‚ðƒTƒ“ƒvƒ‹
;;;;


(load "_runner.l")

(do-snippets (:width 400 :height 400)
  (let ((x 0.5)
        (y 0.5)
        (r 0.5))
    (cairo-set-font-size cr 0.05)
    (cairo-set-line-width cr 0.03)

    ;; heart
    (with-cairo-fill (cr)
      (cairo-set-source-rgba cr 1 0 0 0.5)
      (cairo-heart cr x y r))

    ;; center
    (with-cairo-fill (cr)
      (cairo-set-source-rgb cr 0 1 0)
      (cairo-circle cr x y 0.01))
    ;; center point text
    (with-cairo-save (cr)
      (cairo-move-to cr (- x 0.15) (+ y 0.05))
      (cairo-set-source-rgb cr 0 0 0)
      (cairo-show-text cr (format nil "(x=~F y=~F)" x y))
      (cairo-new-path cr))

    ;; outer circle
    (with-cairo-stroke (cr)
      (cairo-set-source-rgba cr 0 1 0 0.4)
      (cairo-circle cr x y r)
      ;; r line
      (with-cairo-stroke (cr)
        (cairo-move-to cr x y)
        (cairo-line-to cr (+ x r) y))
      (cairo-move-to cr (+ x 0.25) (+ y 0.05))
      (cairo-set-source-rgb cr 0 0 0)
      (cairo-show-text cr (format nil "r=~F" r))
      (cairo-new-path cr))

    ;; outer square
    (with-cairo-stroke (cr)
      (cairo-set-source-rgba cr 1 0 1 0.4)
      (with-cairo-save (cr)
        (cairo-translate cr (- x r) (- y r))
        (cairo-polygon cr
                       `((,r 0)
                         (,(* 2 r) ,r)
                         (,r ,(* 2 r))
                         (0 ,r)))))

    ;; inner square
    (with-cairo-save (cr)
      (cairo-translate cr x y)
      (cairo-scale cr (/ r 1.5) (/ r 1.5))
      (cairo-translate cr 0 -0.5)
      ;; center
      (with-cairo-fill (cr)
        (cairo-set-source-rgb cr 0 0 1)
        (cairo-circle cr 0 1 0.03))
      (with-cairo-stroke (cr)
        (cairo-set-source-rgba cr 0 0 1 0.4)
        (cairo-polygon cr '((0 0) (1 1) (0 2) (-1 1)))))
    ))
