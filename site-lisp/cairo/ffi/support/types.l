;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/support/types.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/package")
  (require "cairo/ffi/macros")
  (require "cairo/ffi/base")
  (require "cairo/ffi/types")
  )


(in-package :cairo.ffi)

;; http://www.cairographics.org/manual/cairo-types.html#cairo-destroy-func-t
(define-callback-function
  c:void
  destroy-func-t ((c:void* data)))

;; http://www.cairographics.org/manual/cairo-png-functions.html#cairo-write-func-t
(define-callback-function
  status-t
  write-func-t ((c:void* closure)
                (u_char* data)
                (c:u_int length)))


(provide "cairo/ffi/support/types")

;;;; End
