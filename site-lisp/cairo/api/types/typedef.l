;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/types/typedef.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/types")
  (require "cairo/api/package")
  (require "cairo/api/macros")
  (require "cairo/api/types/base")
  )


(in-package :cairo)

;;;; Drawing - cairo_t

(define-c-private-struct-wrapper (context
                                  cairo.ffi:cairo-t*
                                  cairo-get-reference-count))

;;;; Drawing - Patterns

(define-c-private-struct-wrapper (pattern
                                  cairo.ffi:pattern-t*
                                  cairo-pattern-get-reference-count))

;;;; Fonts - cairo_font_face_t

(define-c-private-struct-wrapper (font-face
                                  cairo.ffi:font-face-t*
                                  cairo-font-face-get-reference-count))

;;;; Fonts - Scaled Fonts

(define-c-private-struct-wrapper (scaled-font
                                  cairo.ffi:scaled-font-t*
                                  cairo-scaled-font-get-reference-count))

;;;; Fonts - Font Options

(define-c-private-struct-wrapper (font-options
                                  cairo.ffi:font-options-t*
                                  nil))

;;;; Surfaces - cairo_surface_t

(define-c-private-struct-wrapper (surface
                                  cairo.ffi:surface-t*
                                  cairo-surface-get-reference-count))


(provide "cairo/api/types/typedef")

;;;; End
