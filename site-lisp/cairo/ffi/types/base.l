;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/types/base.l
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
  )

(in-package :cairo.ffi)


(define-c-pointer-types
 c:int
 c:short
 c:int
 c:long
 c:float
 c:double
 c:u_char
 c:u_short
 c:u_int
 c:u_long)

(define-chunk-maker-for c:int)
(define-chunk-maker-for c:double)


(provide "cairo/ffi/types/base")

;;;; End
