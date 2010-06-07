;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/types/union.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api/package")
  (require "cairo/api/macros")
  (require "cairo/api/types/base")
  (require "cairo/api/types/enum")
  )

(in-package :cairo)

;; path-t 構造体を直接作ることはないと思うので、private-struct 扱いで。
(define-c-private-struct-wrapper (path
                                  cairo.ffi:path-t*
                                  nil))

(define-c-struct-wrapper (path-data-header
                          cairo.ffi:path-data-t-header))

(define-c-struct-wrapper (path-data-point
                          cairo.ffi:path-data-t-point))


(provide "cairo/api/types/union")

;;;; End
