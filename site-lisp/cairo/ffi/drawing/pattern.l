;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/drawing/pattern.l
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

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-add-color-stop-rgb
(define-cairo-api
  c:void
  %cairo-pattern-add-color-stop-rgb ((pattern-t* pattern)
                                     (c:double offset)
                                     (c:double red)
                                     (c:double green)
                                     (c:double blue)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-add-color-stop-rgba
(define-cairo-api
  c:void
  %cairo-pattern-add-color-stop-rgba ((pattern-t* pattern)
                                      (c:double offset)
                                      (c:double red)
                                      (c:double green)
                                      (c:double blue)
                                      (c:double alpha)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-color-stop-count
(define-cairo-api
  status-t
  %cairo-pattern-get-color-stop-count ((pattern-t* pattern)
                                       (int* count)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-color-stop-rgba
(define-cairo-api
  status-t
  %cairo-pattern-get-color-stop-rgba ((pattern-t* pattern)
                                      (c:int index)
                                      (double* offset)
                                      (double* red)
                                      (double* green)
                                      (double* blue)
                                      (double* alpha)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-create-rgb
(define-cairo-api
  pattern-t*
  %cairo-pattern-create-rgb ((c:double red)
                             (c:double green)
                             (c:double blue)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-create-rgba
(define-cairo-api
  pattern-t*
  %cairo-pattern-create-rgba ((c:double red)
                              (c:double green)
                              (c:double blue)
                              (c:double alpha)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-rgba
(define-cairo-api
  status-t
  %cairo-pattern-get-rgba ((pattern-t* pattern)
                           (double* red)
                           (double* green)
                           (double* blue)
                           (double* alpha)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-create-for-surface
(define-cairo-api
  pattern-t*
  %cairo-pattern-create-for-surface ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-surface
(define-cairo-api
  status-t
  %cairo-pattern-get-surface ((pattern-t* pattern)
                              (surface-t** surface)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-create-linear
(define-cairo-api
  pattern-t*
  %cairo-pattern-create-linear ((c:double x0)
                                (c:double y0)
                                (c:double x1)
                                (c:double y1)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-linear-points
(define-cairo-api
  status-t
  %cairo-pattern-get-linear-points ((pattern-t* pattern)
                                    (double* x0)
                                    (double* y0)
                                    (double* x1)
                                    (double* y1)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-create-radial
(define-cairo-api
  pattern-t*
  %cairo-pattern-create-radial ((c:double cx0)
                                (c:double cy0)
                                (c:double radius0)
                                (c:double cx1)
                                (c:double cy1)
                                (c:double radius1)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-radial-circles
(define-cairo-api
  status-t
  %cairo-pattern-get-radial-circles ((pattern-t* pattern)
                                     (double* x0)
                                     (double* y0)
                                     (double* r0)
                                     (double* x1)
                                     (double* y1)
                                     (double* r1)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-reference
(define-cairo-api
  pattern-t*
  %cairo-pattern-reference ((pattern-t* pattern)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-destroy
(define-cairo-api
  c:void
  %cairo-pattern-destroy ((pattern-t* pattern)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-status
(define-cairo-api
  status-t
  %cairo-pattern-status ((pattern-t* pattern)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-set-extend
(define-cairo-api
  c:void
  %cairo-pattern-set-extend ((pattern-t* pattern)
                             (extend-t extend)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-extend
(define-cairo-api
  extend-t
  %cairo-pattern-get-extend ((pattern-t* pattern)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-set-filter
(define-cairo-api
  c:void
  %cairo-pattern-set-filter ((pattern-t* pattern)
                             (filter-t filter)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-filter
(define-cairo-api
  filter-t
  %cairo-pattern-get-filter ((pattern-t* pattern)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-set-matrix
(define-cairo-api
  c:void
  %cairo-pattern-set-matrix ((pattern-t* pattern)
                             (matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-matrix
(define-cairo-api
  c:void
  %cairo-pattern-get-matrix ((pattern-t* pattern)
                             (matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-type
(define-cairo-api
  pattern-type-t
  %cairo-pattern-get-type ((pattern-t* pattern)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-reference-count
(define-cairo-api
  c:u_int
  %cairo-pattern-get-reference-count ((pattern-t* pattern)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-set-user-data
(define-cairo-api
  status-t
  %cairo-pattern-set-user-data ((pattern-t* pattern)
                                (user-data-key-t* key)
                                (c:void* user-data)
                                (destroy-func-t destroy)))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-get-user-data
(define-cairo-api
  c:void*
  %cairo-pattern-get-user-data ((pattern-t* pattern)
                                (user-data-key-t* key)))



(provide "cairo/ffi/drawing/pattern")

;;;; End
