;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/fonts/font-face.l
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

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-face-reference
(define-cairo-api
  font-face-t*
  %cairo-font-face-reference ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-face-destroy
(define-cairo-api
  c:void
  %cairo-font-face-destroy ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-face-status
(define-cairo-api
  status-t
  %cairo-font-face-status ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-face-get-type
(define-cairo-api
  font-type-t
  %cairo-font-face-get-type ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-face-get-reference-count
(define-cairo-api
  c:u_int
  %cairo-font-face-get-reference-count ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-face-set-user-data
(define-cairo-api
  status-t
  %cairo-font-face-set-user-data ((font-face-t* font-face)
                                  (user-data-key-t* key)
                                  (c:void* user-data)
                                  (destroy-func-t destroy)))

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-face-get-user-data
(define-cairo-api
  c:void*
  %cairo-font-face-get-user-data ((font-face-t* font-face)
                                  (user-data-key-t* key)))



(provide "cairo/ffi/fonts/font-face")

;;;; End
