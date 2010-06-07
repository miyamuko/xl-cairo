;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/support/error-status.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: full
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/package")
  (require "cairo/ffi/macros")
  (require "cairo/ffi/base")
  (require "cairo/ffi/types")
  (require "cairo/ffi/support/types")
  )


(in-package :cairo.ffi)

;; http://www.cairographics.org/manual/cairo-error-status.html#cairo-status-to-string
(define-cairo-api
  c:char*
  %cairo-status-to-string ((status-t status)))

;; http://www.cairographics.org/manual/cairo-error-status.html#cairo-debug-reset-static-data
(define-cairo-api
  c:void
  %cairo-debug-reset-static-data ())



(provide "cairo/ffi/support/error-status")

;;;; End
