;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ffi/drawing.l
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
  (require "cairo/ffi/util")

  (require "cairo/ffi/drawing/context")
  (require "cairo/ffi/drawing/paths")
  (require "cairo/ffi/drawing/pattern")
  (require "cairo/ffi/drawing/transformations")
  (require "cairo/ffi/drawing/text")
  )

(provide "cairo/ffi/drawing")

;;;; End
