;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ffi.l
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
  (require "cairo/ffi/types")
  (require "cairo/ffi/support")
  (require "cairo/ffi/drawing")
  (require "cairo/ffi/fonts")
  (require "cairo/ffi/surfaces")
  (require "cairo/ffi/win32")
  )

(provide "cairo/ffi")

;;;; End
