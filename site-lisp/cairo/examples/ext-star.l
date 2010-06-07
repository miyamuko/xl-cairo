(load "_runner.l")

(defun draw-star (cr color n &key x-center y-center outer-radius inner-radius hook)
  (let* ((margin 0.1)
         (xc (or x-center 0.5))
         (yc (or y-center (- 0.5 (/ margin 2.0))))
         (oradius (or outer-radius (- 0.5 margin)))
         (iradius (or inner-radius (/ oradius 2.0))))
    (cairo-scale cr 1/2 1/2)

    ;; òg
    (with-cairo-stroke (cr)
      (cairo-set-source-rgb cr 0.7 0.7 0.7)
      (cairo-rectangle cr 0 0 1 1))

    ;; Åô
    (with-cairo-fill (cr)
      (cairo-star cr n xc yc oradius iradius)
      (when hook (funcall hook cr))
      (apply 'cairo-set-source-rgb cr color))

    ;; à¯êîÇï\é¶
    (cairo-set-source-rgb cr 0.2 0.2 0.2)
    (cairo-move-to cr (/ margin 4.0) (+ yc oradius 0.06))
    (cairo-show-text cr (format nil "n=~A x-center=~A y-center=~A"
                                n xc yc))
    (cairo-move-to cr (/ margin 4.0) (+ yc oradius (* 0.06 2)))
    (cairo-show-text cr (format nil "outer-radius=~A inner-radius=~A"
                                oradius iradius))
    ))

(do-snippets (:width 400 :height 400)
  (cairo-set-font-size cr 0.06)
  (cairo-set-line-width cr 0.01)
  (cairo-set-source-rgb cr 1 1 1)
  (cairo-paint cr)

  (with-cairo-save (cr)
    (cairo-translate cr 0 0)
    (draw-star cr '(1 1 0) 5
               :hook #'(lambda (cr)
                         (cairo-set-source-rgb cr 0.8 0.8 0)
                         (cairo-set-line-width cr 0.03)
                         (cairo-stroke-preserve cr))))

  (with-cairo-save (cr)
    (cairo-translate cr 0.5 0)
    (draw-star cr '(0 1 1) 4))

  (with-cairo-save (cr)
    (cairo-translate cr 0 0.5)
    (draw-star cr '(0 0 1) 80 :outer-radius 0.4 :inner-radius 0.05))

  (with-cairo-save (cr)
    (cairo-translate cr 0.5 0.5)
    (draw-star cr '(1 0.5 0.5) 19 :outer-radius 0.4 :inner-radius 0.35
               :hook #'(lambda (cr)
                         (cairo-set-source-rgb cr 1 0 0)
                         (cairo-stroke-preserve cr))))
  )
