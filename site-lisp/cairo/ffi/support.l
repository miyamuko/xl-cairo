;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ffi/support.l
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

  (require "cairo/ffi/support/matrix")
  (require "cairo/ffi/support/error-status")
  (require "cairo/ffi/support/version-info")
  (require "cairo/ffi/support/types")
  )

(provide "cairo/ffi/support")

;;;; End
