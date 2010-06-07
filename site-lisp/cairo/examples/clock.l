;; http://ralph-glass.homepage.t-online.de/clock/readme.html
;; �̈ڐA

(load "_runner.l")

(do-snippets (:width 300 :height 300 :normalize nil)
  (multiple-value-bind (second minute hour day month year tz)
      (decode-universal-time (get-universal-time))
    (when (< 12 hour)
      (decf hour 12))
    (let* ((minute-arc (* (/ (* 2 pi) 60) minute))
           (hour-arc (* (/ (* 2 pi) 12) (+ hour (/ minute-arc 12)))))
      (let ((w width)
            (h height)
            (w/2 (/ width 2))
            (h/2 (/ height 2))
            (2pi (* pi 2)))

        ;; clock background
        (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
        (cairo-arc cr w/2 h/2 (- (/ (min w h) 2) 8) 0 2pi)
        (cairo-fill cr)
        (cairo-stroke cr)

        ;;  center arc
        (cairo-set-source-rgb cr 0 0 0)
        (cairo-arc cr w/2 h/2 (/ (- (/ (min w h) 2) 20) 5) 0 2pi)
        (cairo-fill cr)
        (cairo-line-to cr w/2 h/2)
        (cairo-stroke cr)

        ;; pointer hour
        (cairo-set-source-rgba cr 0.5 0.5 0.5 0.5)
        (cairo-set-line-width cr (/ (- (/ (min w h) 2) 20) 6))
        (cairo-move-to cr w/2 h/2)
        (cairo-line-to cr
                       (+ w/2 (* (- (/ (min w h) 2) 20) 0.6 (cos (- hour-arc (/ pi 2)))))
                       (+ h/2 (* (- (/ (min w h) 2) 20) 0.6 (sin (- hour-arc (/ pi 2))))))
        (cairo-stroke cr)

        ;; pointer minute
        (cairo-set-source-rgba cr 0.5 0.5 0.5 0.5)
        (cairo-set-line-width cr (* (/ (- (/ (min w h) 2) 20) 6) 0.8))
        (cairo-move-to cr w/2 h/2)
        (cairo-line-to cr
                       (+ w/2 (* (- (/ (min w h) 2) 20) 0.8 (cos (- minute-arc (/ pi 2)))))
                       (+ h/2 (* (- (/ (min w h) 2) 20) 0.8 (sin (- minute-arc (/ pi 2))))))
        (cairo-stroke cr)))))
