;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/api/drawing/heart.l
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

(export '(cairo-heart
          ))

(defconstant wing-radius (/ (sqrt 2) 2))

(defconstant radian+45     (degree->radian 45))
(defconstant radian+45-180 (degree->radian (+ 45 -180)))
(defconstant radian-45     (degree->radian -45))
(defconstant radian-45-180 (degree->radian (+ -45 -180)))


(defun cairo-heart (cr x y radius)
  (with-cairo-save (cr)
    (cairo-translate cr x y)
    (cairo-scale cr (/ radius 1.5) (/ radius 1.5))
    (cairo-translate cr 0 -0.5)
    (cairo-move-to cr 0 2)
    (cairo-line-to cr 1 1)
    (cairo-arc-negative cr  1/2 1/2 wing-radius radian+45 radian+45-180)
    (cairo-arc-negative cr -1/2 1/2 wing-radius radian-45 radian-45-180)
    (cairo-close-path cr)))


(provide "cairo/ext/api/drawing/heart")

;;;; End
