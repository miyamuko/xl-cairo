;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ffi/fonts.l
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

  (require "cairo/ffi/fonts/font-face")
  (require "cairo/ffi/fonts/scaled-font")
  (require "cairo/ffi/fonts/font-options")
  (require "cairo/ffi/fonts/win32-font")
  (require "cairo/ffi/fonts/user-font")
  )

(provide "cairo/ffi/fonts")

;;;; End
