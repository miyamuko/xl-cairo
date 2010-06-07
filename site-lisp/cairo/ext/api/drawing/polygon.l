;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/api/drawing/polygon.l
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

(export '(cairo-regular-polygon
          cairo-polyline
          cairo-polygon
          cairo-triangle
          ))

(defun cairo-regular-polygon (cr n xc yc radius)
  (let ((dn (coerce n 'double-float))
        (90rad (degree->radian 90)))
    (cairo-new-path cr)
    (dotimes (i n)
      (let ((angle (- (* 2pi (/ i dn)) 90rad)))
        (cairo-arc cr xc yc radius angle angle)))
    (cairo-close-path cr)))

(defun cairo-polyline (cr points)
  (flet ((x (point)
           (car point))
         (y (point)
           (let ((r (cdr point)))
             (if (atom r) r (car r)))))
    (cairo-move-to cr (x (car points)) (y (car points)))
    (dolist (pt (cdr points))
      (cairo-line-to cr (x pt) (y pt)))))

(defun cairo-polygon (cr points)
  (cairo-polyline cr points)
  (cairo-close-path cr))

(defun cairo-triangle (cr x1 y1 x2 y2 x3 y3)
  (cairo-polygon cr (list (cons x1 y1)
                          (cons x2 y2)
                          (cons x3 y3))))


(provide "cairo/ext/api/drawing/polygon")

;;;; End
