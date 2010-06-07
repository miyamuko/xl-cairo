;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ffi/types.l
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

  (require "cairo/ffi/types/typedef")
  (require "cairo/ffi/types/enum")
  (require "cairo/ffi/types/struct")
  (require "cairo/ffi/types/union")
  (require "cairo/ffi/types/win32")
  )

(provide "cairo/ffi/types")

;;;; End
