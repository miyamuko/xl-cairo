;;;;
;;;; lissajous-curves.l - リサージュ曲線を描くサンプル
;;;;
;;;; cl-cairo2 の example の移植
;;;; http://common-lisp.net/project/cl-cairo2/tutorial.pdf
;;;;

(load "_runner.l")

(defun show-text-aligned (cr text x y &optional (x-align 0.5) (y-align 0.5))
  (multiple-value-bind (x-bearing y-bearing width height)
      (cairo-text-extents cr text)
    (cairo-move-to cr (- x (* width x-align) x-bearing)
                   (- y (* height y-align) y-bearing))
    (cairo-show-text cr text)))

(defparameter margin 20)
(defparameter a 9)
(defparameter b 8)
(defparameter delta (/ pi 2))
(defparameter density 2000)

(do-snippets (:normalize nil :width 600 :height 600)
  ;; pastel blue background
  (cairo-set-source-rgb cr 0.9 0.9 1)
  (cairo-paint cr)
  ;; Lissajous curves, blue
  (labels ((stretch (x)
             (+ (* (1+ x) (- (/ width 2) margin)) margin)))
    (cairo-move-to cr (stretch (sin delta)) (stretch 0))
    (dotimes (i density)
      (let* ((v (/ (* i pi 2) density))
             (x (sin (+ (* a v) delta)))
             (y (sin (* b v))))
        (cairo-line-to cr (stretch x) (stretch y)))))
  (cairo-close-path cr)
  (cairo-set-line-width cr 0.5)
  (cairo-set-source-rgb cr 0 0 1)
  (cairo-stroke cr)
  ;; "cl-cairo2" in Arial bold to the center
  (cairo-select-font-face cr "Arial" :normal :bold)
  (cairo-set-font-size cr 100)
  (cairo-set-source-rgba cr 1 0.75 0 0.5)		; orange
  (show-text-aligned cr "xl-cairo" (/ width 2) (/ width 2)))
