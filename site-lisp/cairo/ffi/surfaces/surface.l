;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/surfaces/surface.l
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

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-create-similar
(define-cairo-api
  surface-t*
  %cairo-surface-create-similar ((surface-t* other)
                                 (content-t content)
                                 (c:int width)
                                 (c:int height)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-reference
(define-cairo-api
  surface-t*
  %cairo-surface-reference ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-destroy
(define-cairo-api
  c:void
  %cairo-surface-destroy ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-status
(define-cairo-api
  status-t
  %cairo-surface-status ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-finish
(define-cairo-api
  c:void
  %cairo-surface-finish ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-flush
(define-cairo-api
  c:void
  %cairo-surface-flush ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-get-font-options
(define-cairo-api
  c:void
  %cairo-surface-get-font-options ((surface-t* surface)
                                   (font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-get-content
(define-cairo-api
  content-t
  %cairo-surface-get-content ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-mark-dirty
(define-cairo-api
  c:void
  %cairo-surface-mark-dirty ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-mark-dirty-rectangle
(define-cairo-api
  c:void
  %cairo-surface-mark-dirty-rectangle ((surface-t* surface)
                                       (c:int x)
                                       (c:int y)
                                       (c:int width)
                                       (c:int height)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-set-device-offset
(define-cairo-api
  c:void
  %cairo-surface-set-device-offset ((surface-t* surface)
                                    (c:double x-offset)
                                    (c:double y-offset)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-get-device-offset
(define-cairo-api
  c:void
  %cairo-surface-get-device-offset ((surface-t* surface)
                                    (double* x-offset)
                                    (double* y-offset)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-set-fallback-resolution
(define-cairo-api
  c:void
  %cairo-surface-set-fallback-resolution ((surface-t* surface)
                                          (c:double x-pixels-per-inch)
                                          (c:double y-pixels-per-inch)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-get-fallback-resolution
(define-cairo-api
  c:void
  %cairo-surface-get-fallback-resolution ((surface-t* surface)
                                          (double* x-pixels-per-inch)
                                          (double* y-pixels-per-inch)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-get-type
(define-cairo-api
  surface-type-t
  %cairo-surface-get-type ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-get-reference-count
(define-cairo-api
  c:u_int
  %cairo-surface-get-reference-count ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-set-user-data
(define-cairo-api
  status-t
  %cairo-surface-set-user-data ((surface-t* surface)
                                (user-data-key-t* key)
                                (c:void* user-data)
                                (destroy-func-t destroy)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-get-user-data
(define-cairo-api
  c:void*
  %cairo-surface-get-user-data ((surface-t* surface)
                                (user-data-key-t* key)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-copy-page
(define-cairo-api
  c:void
  %cairo-surface-copy-page ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-show-page
(define-cairo-api
  c:void
  %cairo-surface-show-page ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-has-show-text-glyphs
(define-cairo-api
  bool-t
  %cairo-surface-has-show-text-glyphs ((surface-t* surface)))



(provide "cairo/ffi/surfaces/surface")

;;;; End
