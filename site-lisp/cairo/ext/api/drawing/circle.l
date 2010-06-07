;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/api/drawing/circle.l
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

(export '(cairo-circle
          ))

(defun cairo-circle (cr x y radius)
  (cairo-arc cr x y radius 0 2pi))


(provide "cairo/ext/api/drawing/circle")

;;;; End
