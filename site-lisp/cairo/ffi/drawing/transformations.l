;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/drawing/transformations.l
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

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-translate
(define-cairo-api
  c:void
  %cairo-translate ((cairo-t* cr)
                    (c:double tx)
                    (c:double ty)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-scale
(define-cairo-api
  c:void
  %cairo-scale ((cairo-t* cr)
                (c:double sx)
                (c:double sy)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-rotate
(define-cairo-api
  c:void
  %cairo-rotate ((cairo-t* cr)
                 (c:double angle)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-transform
(define-cairo-api
  c:void
  %cairo-transform ((cairo-t* cr)
                    (matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-set-matrix
(define-cairo-api
  c:void
  %cairo-set-matrix ((cairo-t* cr)
                     (matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-get-matrix
(define-cairo-api
  c:void
  %cairo-get-matrix ((cairo-t* cr)
                     (matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-identity-matrix
(define-cairo-api
  c:void
  %cairo-identity-matrix ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-user-to-device
(define-cairo-api
  c:void
  %cairo-user-to-device ((cairo-t* cr)
                         (double* x)
                         (double* y)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-user-to-device-distance
(define-cairo-api
  c:void
  %cairo-user-to-device-distance ((cairo-t* cr)
                                  (double* dx)
                                  (double* dy)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-device-to-user
(define-cairo-api
  c:void
  %cairo-device-to-user ((cairo-t* cr)
                         (double* x)
                         (double* y)))

;; http://www.cairographics.org/manual/cairo-transformations.html#cairo-device-to-user-distance
(define-cairo-api
  c:void
  %cairo-device-to-user-distance ((cairo-t* cr)
                                  (double* dx)
                                  (double* dy)))



(provide "cairo/ffi/drawing/transformations")

;;;; End
