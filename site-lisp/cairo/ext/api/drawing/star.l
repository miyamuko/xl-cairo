;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/api/drawing/star.l
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

(export '(cairo-star
          ))

(defun cairo-star (cr n x y outer-radius inner-radius)
  (let ((unit (/ 2pi n)))
    (with-cairo-save (cr)
      (cairo-translate cr x y)
      (cairo-rotate cr (degree->radian -90))
      (dotimes (i n)
        (let* ((rad (* unit i))
               (rad2 (+ rad (/ unit 2))))
          (cairo-arc cr 0 0 outer-radius rad rad)
          (cairo-arc cr 0 0 inner-radius rad2 rad2)))
      (cairo-close-path cr))))


(provide "cairo/ext/api/drawing/star")

;;;; End
