(load "_runner.l")

(defun draw-round-rect (cr x-radius y-radius color &key x y width height)
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
      (cairo-rounded-rectangle cr x y w h x-radius y-radius))

    ;; à¯êîÇï\é¶
    (cairo-set-source-rgb cr 0.2 0.2 0.2)
    (cairo-move-to cr margin (+ y h 0.06))
    (cairo-show-text cr (format nil "x=~A, y=~A, w=~A, h=~A"
                                x y w h))
    (cairo-move-to cr margin (+ y h (* 0.06 2)))
    (cairo-show-text cr (format nil "x-radius=~A, y-radius=~A"
                                x-radius y-radius))
    ))

(do-snippets (:width 400 :height 400)
  (cairo-set-font-size cr 0.06)
  (cairo-set-line-width cr 0.01)
  (cairo-set-source-rgb cr 1 1 1)
  (cairo-paint cr)

  (with-cairo-save (cr)
    (cairo-translate cr 0 0)
    (draw-round-rect cr 0.2 0.2 '(1 0 0)))

  (with-cairo-save (cr)
    (cairo-translate cr 0.5 0)
    (draw-round-rect cr 0.2 0.5 '(0 1 0)))

  (with-cairo-save (cr)
    (cairo-translate cr 0 0.5)
    (draw-round-rect cr 0 0.3 '(0 0 1)))

  (with-cairo-save (cr)
    (cairo-translate cr 0.5 0.5)
    (draw-round-rect cr 0.3 0.3 '(0 1 1) :x 0.3 :width 0.4 :height 0.8))
  )
