;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/api/drawing/rectangle.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api")
  (require "cairo/ext/package")
  (require "cairo/ext/util")
  )

(in-package :cairo.ext)

(export '(cairo-rounded-rectangle
          cairo-rounded-rectangle-complex
          ))

(defun cairo-rounded-rectangle (cr x y width height
                                   x-radius &optional y-radius)
  (unless y-radius
    (setf y-radius x-radius))
  (let* ((x1 x) (x2 (+ x width))
         (y1 y) (y2 (+ y height))
         (xr1 (min x-radius (/ width 2.0d0)))
         (yr1 (min y-radius (/ height 2.0d0)))
         (xr2 (/ xr1 2.0d0))
         (yr2 (/ yr1 2.0d0)))
    (cairo-move-to cr (+ x1 xr1) y1)
    (cairo-line-to cr (- x2 xr1) y1)
    (cairo-curve-to cr (- x2 xr2) y1 x2 (+ y1 yr2) x2 (+ y1 yr1))
    (cairo-line-to cr x2 (- y2 yr1))
    (cairo-curve-to cr x2 (- y2 yr2) (- x2 xr2) y2 (- x2 xr1) y2)
    (cairo-line-to cr (+ x1 xr1) y2)
    (cairo-curve-to cr (+ x1 xr2) y2 x1 (- y2 yr2) x1 (- y2 yr1))
    (cairo-line-to cr x1 (+ y1 yr1))
    (cairo-curve-to cr x1 (+ y1 yr2) (+ x1 xr2) y1 (+ x1 xr1) y1)
    (cairo-close-path cr)))

(defun cairo-rounded-rectangle-complex (cr x y width height
                                           &key
                                           (radius 0)
                                           top-left
                                           top-right
                                           bottom-left
                                           bottom-right)
  (labels ((grow (lst n)
             (cond ((null lst) (grow 0 n))
                   ((atom lst) (grow (list lst) n))
                   ((< (length lst) n)
                    (grow (append lst lst) n))
                   (t
                    (subseq lst 0 n)))))
    (setf radius (grow radius 4))
    (let* ((x1 x) (x2 (+ x width))
           (y1 y) (y2 (+ y height))
           (max-rad (min (/ width 2.0d0) (/ height 2.0d0)))
           (tl (min max-rad (or top-left     (nth 0 radius))))
           (tr (min max-rad (or top-right    (nth 1 radius))))
           (br (min max-rad (or bottom-right (nth 2 radius))))
           (bl (min max-rad (or bottom-left  (nth 3 radius)))))
      ;; ¨
      (cairo-arc cr (+ x1 tl) (+ y1 tl) tl (degree->radian 180) (degree->radian 270))
      (cairo-line-to cr (- x2 tr) y1)

      ;; «
      (cairo-arc cr (- x2 tr) (+ y1 tr) tr (degree->radian 270) (degree->radian 360))
      (cairo-line-to cr x2 (- y2 br))

      ;; ©
      (cairo-arc cr (- x2 br) (- y2 br) br (degree->radian 0) (degree->radian 90))
      (cairo-line-to cr (+ x1 bl) y2)

      ;; ª
      (cairo-arc cr (+ x1 bl) (- y2 bl) bl (degree->radian 90) (degree->radian 180))
      (cairo-line-to cr x1 (+ y1 tl))

      (cairo-close-path cr))))


(provide "cairo/ext/api/drawing/rectangle")

;;;; End
