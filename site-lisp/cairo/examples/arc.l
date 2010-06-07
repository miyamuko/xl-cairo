(load "_runner.l")
(do-snippets ()
  (let ((xc 0.5)
        (yc 0.5)
        (radius 0.4)
        (angle1 (* 45.0 (/ pi 180.0)))  ;; angles are specified
        (angle2 (* 180.0 (/ pi 180.0)))) ;; in radians
    (with-cairo-stroke (cr)
      (cairo-arc cr xc yc radius angle1 angle2))

    ;; draw helping lines
    (with-cairo-fill (cr)
      (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
      (cairo-arc cr xc yc 0.05 0 (* 2 pi)))
    (with-cairo-stroke (cr)
      (cairo-set-line-width cr 0.03)
      (cairo-arc cr xc yc radius angle1 angle1)
      (cairo-line-to cr xc yc)
      (cairo-arc cr xc yc radius angle2 angle2)
      (cairo-line-to cr xc yc))))
