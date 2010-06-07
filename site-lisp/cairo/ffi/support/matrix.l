;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/support/matrix.l
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

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-init
(define-cairo-api
  c:void
  %cairo-matrix-init ((matrix-t* matrix)
                      (c:double xx)
                      (c:double yx)
                      (c:double xy)
                      (c:double yy)
                      (c:double x0)
                      (c:double y0)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-init-identity
(define-cairo-api
  c:void
  %cairo-matrix-init-identity ((matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-init-translate
(define-cairo-api
  c:void
  %cairo-matrix-init-translate ((matrix-t* matrix)
                                (c:double tx)
                                (c:double ty)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-init-scale
(define-cairo-api
  c:void
  %cairo-matrix-init-scale ((matrix-t* matrix)
                            (c:double sx)
                            (c:double sy)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-init-rotate
(define-cairo-api
  c:void
  %cairo-matrix-init-rotate ((matrix-t* matrix)
                             (c:double radians)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-translate
(define-cairo-api
  c:void
  %cairo-matrix-translate ((matrix-t* matrix)
                           (c:double tx)
                           (c:double ty)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-scale
(define-cairo-api
  c:void
  %cairo-matrix-scale ((matrix-t* matrix)
                       (c:double sx)
                       (c:double sy)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-rotate
(define-cairo-api
  c:void
  %cairo-matrix-rotate ((matrix-t* matrix)
                        (c:double radians)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-invert
(define-cairo-api
  status-t
  %cairo-matrix-invert ((matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-multiply
(define-cairo-api
  c:void
  %cairo-matrix-multiply ((matrix-t* result)
                          (matrix-t* a)
                          (matrix-t* b)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-transform-distance
(define-cairo-api
  c:void
  %cairo-matrix-transform-distance ((matrix-t* matrix)
                                    (double* dx)
                                    (double* dy)))

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-transform-point
(define-cairo-api
  c:void
  %cairo-matrix-transform-point ((matrix-t* matrix)
                                 (double* x)
                                 (double* y)))



(provide "cairo/ffi/support/matrix")

;;;; End
