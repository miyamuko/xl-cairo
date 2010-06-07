;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ffi/win32.l
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
  (require "cairo/ffi/win32/kernel32")
  )

(provide "cairo/ffi/win32")

;;;; End
