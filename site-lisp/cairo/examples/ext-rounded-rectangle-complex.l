(load "_runner.l")

(defun draw-round-rect-complex (cr color &key x y width height
                                   radius top-left top-right bottom-left bottom-right)
  (let* ((margin 0.1)
         (x (or x (+ 0 margin)))
         (y (or y (+ 0 (/ margin 2))))
         (w (or width (- 1 (* 2 margin))))
         (h (or height w)))
    (cairo-scale cr 1/2 1/2)

    ;; òg
    (with-cairo-stroke (cr)
      (cairo-set-source-rgb cr 0.7 0.7 0.7)
      (cairo-rectangle cr 0 0 1 1))

    ;; ä€äp
    (with-cairo-fill (cr)
      (apply 'cairo-set-source-rgb cr color)
      (cairo-rounded-rectangle-complex cr x y w h
                                       :radius radius
                                       :top-left top-left :top-right top-right
                                       :bottom-left bottom-left :bottom-right bottom-right))

    ;; à¯êîÇï\é¶
    (cairo-set-source-rgb cr 0.2 0.2 0.2)
    (cairo-move-to cr margin (+ y h 0.06))
    (cairo-show-text cr (format nil "x=~A y=~A w=~A h=~A"
                                x y w h))
    (cairo-move-to cr margin (+ y h (* 0.06 2)))
    (cairo-show-text cr (format nil "radius=~A tl=~A tr=~A bl=~A br=~A"
                                radius top-left top-right bottom-left bottom-right))
    ))

(do-snippets (:width 600 :height 600)
  (cairo-set-font-size cr 0.05)
  (cairo-set-line-width cr 0.01)
  (cairo-set-source-rgb cr 1 1 1)
  (cairo-paint cr)

  (with-cairo-save (cr)
    (cairo-translate cr 0 0)
    (draw-round-rect-complex cr '(1 0 0)
                             :radius 0.1))

  (with-cairo-save (cr)
    (cairo-translate cr 0.5 0)
    (draw-round-rect-complex cr '(0 1 0)
                             :radius 0.1
                             :top-left 0.4
                             :top-right 0.4))

  (with-cairo-save (cr)
    (cairo-translate cr 0 0.5)
    (draw-round-rect-complex cr '(0 0 1)
                             :radius '(0 0.3 0 0.3)))

  (with-cairo-save (cr)
    (cairo-translate cr 0.5 0.5)
    (draw-round-rect-complex cr '(0 1 1)
                             :radius '(0.6 0.3)
                             :bottom-left 0))
  )
