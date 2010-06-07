;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ext/api/drawing.l
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
  (require "cairo/ext/api/drawing/circle")
  (require "cairo/ext/api/drawing/polygon")
  (require "cairo/ext/api/drawing/rectangle")
  (require "cairo/ext/api/drawing/star")
  (require "cairo/ext/api/drawing/heart")

  (require "cairo/ext/api/drawing/paths")
  )

(provide "cairo/ext/api/drawing")

;;;; End
