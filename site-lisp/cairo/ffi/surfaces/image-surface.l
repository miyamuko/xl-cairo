;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/surfaces/image-surface.l
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

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-format-stride-for-width
(define-cairo-api
  c:int
  %cairo-format-stride-for-width ((format-t format)
                                  (c:int width)))

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-image-surface-create
(define-cairo-api
  surface-t*
  %cairo-image-surface-create ((format-t format)
                               (c:int width)
                               (c:int height)))

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-image-surface-create-for-data
(define-cairo-api
  surface-t*
  %cairo-image-surface-create-for-data ((u_char* data)
                                        (format-t format)
                                        (c:int width)
                                        (c:int height)
                                        (c:int stride)))

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-image-surface-get-data
(define-cairo-api
  u_char*
  %cairo-image-surface-get-data ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-image-surface-get-format
(define-cairo-api
  format-t
  %cairo-image-surface-get-format ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-image-surface-get-width
(define-cairo-api
  c:int
  %cairo-image-surface-get-width ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-image-surface-get-height
(define-cairo-api
  c:int
  %cairo-image-surface-get-height ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-image-surface-get-stride
(define-cairo-api
  c:int
  %cairo-image-surface-get-stride ((surface-t* surface)))



(provide "cairo/ffi/surfaces/image-surface")

;;;; End
