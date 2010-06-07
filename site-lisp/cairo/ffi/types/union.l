;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/types/union.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/package")
  (require "cairo/ffi/macros")
  (require "cairo/ffi/types/base")
  (require "cairo/ffi/types/enum")
  )

(in-package :cairo.ffi)

(define-c-struct-with-ptr path-data-t-header
  (path-data-type-t type)
  (c:int length))

(define-c-struct-with-ptr path-data-t-point
  (c:double x)
  (c:double y))

(define-c-union-with-ptr path-data-t
  (path-data-t-header header)
  (path-data-t-point point))


(provide "cairo/ffi/types/union")

;;;; End
