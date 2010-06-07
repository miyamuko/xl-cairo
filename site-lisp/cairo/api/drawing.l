;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/api/drawing.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(in-package :user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api/drawing/context")
  (require "cairo/api/drawing/paths")
  (require "cairo/api/drawing/pattern")
  (require "cairo/api/drawing/transformations")
  (require "cairo/api/drawing/text")
  )

(provide "cairo/api/drawing")

;;;; End
