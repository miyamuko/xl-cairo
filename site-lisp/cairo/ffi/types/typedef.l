;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/types/typedef.l
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
  (require "cairo/ffi/types/base")
  )


(in-package :cairo.ffi)

;;;; cairo-drawing - cairo_t

;; http://www.cairographics.org/manual/cairo-context.html#cairo-t
(define-c-private-struct-with-ptr cairo-t)

;;;; cairo-drawing - cairo_pattern_t

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-t
(define-c-private-struct-with-ptr pattern-t)

;;;; cairo-fonts - cairo_font_face_t

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-face-t
(define-c-private-struct-with-ptr font-face-t)

;;;; cairo-fonts - cairo_scaled_font_t

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-t
(define-c-private-struct-with-ptr scaled-font-t)

;;;; cairo-fonts - cairo_font_options_t

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-t
(define-c-private-struct-with-ptr font-options-t)

;;;; cairo-surfaces - cairo_surface_t

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-t
(define-c-private-struct-with-ptr surface-t)

;;;; cairo-support - Types

;; http://www.cairographics.org/manual/cairo-types.html#cairo-bool-t
(c:*define-c-type c:int bool-t)



(provide "cairo/ffi/types/typedef")

;;;; End
