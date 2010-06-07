;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ffi/surfaces.l
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

  (require "cairo/ffi/surfaces/surface")
  (require "cairo/ffi/surfaces/image-surface")
  (require "cairo/ffi/surfaces/png-functions")
  (require "cairo/ffi/surfaces/svg-surface")
  (require "cairo/ffi/surfaces/pdf-surface")
  (require "cairo/ffi/surfaces/ps-surface")
  (require "cairo/ffi/surfaces/win32-surface")
  )

(provide "cairo/ffi/surfaces")

;;;; End
