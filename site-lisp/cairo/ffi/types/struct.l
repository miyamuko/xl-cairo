;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/types/struct.l
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
  (require "cairo/ffi/types/enum")
  (require "cairo/ffi/types/union")
  )


(in-package :cairo.ffi)

;;;; cairo-drawing - cairo_t

;; http://www.cairographics.org/manual/cairo-context.html#cairo-rectangle-t
(define-c-struct-with-ptr rectangle-t
  (c:double x)
  (c:double y)
  (c:double width)
  (c:double height))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-rectangle-list-t
(define-c-struct-with-ptr rectangle-list-t
  (status-t status)
  (rectangle-t* rectangles)
  (c:int num-rectangles))

;;;; cairo-drawing - Paths

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-path-t
(define-c-struct-with-ptr path-t
  (status-t status)
  (path-data-t* data)
  (c:int num-data))

;;;; cairo-drawing - Text

;; http://www.cairographics.org/manual/cairo-text.html#cairo-glyph-t
(define-c-struct-with-ptr glyph-t
  (c:u_long index)
  (c:double x)
  (c:double y))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-text-cluster-t
(define-c-struct-with-ptr text-cluster-t
  (c:int num-bytes)
  (c:int num-glyphs))

;;;; cairo-fonts - cairo_scaled_font_t

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-font-extents-t
(define-c-struct-with-ptr font-extents-t
  (c:double ascent)
  (c:double descent)
  (c:double height)
  (c:double max-x-advance)
  (c:double max-y-advance))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-text-extents-t
(define-c-struct-with-ptr text-extents-t
  (c:double x-bearing)
  (c:double y-bearing)
  (c:double width)
  (c:double height)
  (c:double x-advance)
  (c:double y-advance))

;;;; cairo-support - cairo_matrix_t

;; http://www.cairographics.org/manual/cairo-matrix.html#cairo-matrix-t
(define-c-struct-with-ptr matrix-t
  (c:double xx)
  (c:double yx)
  (c:double xy)
  (c:double yy)
  (c:double x0)
  (c:double y0))

;;;; cairo-support - Types

;; http://www.cairographics.org/manual/cairo-types.html#cairo-user-data-key-t
(define-c-struct-with-ptr user-data-key-t
  (c:int unused))



(provide "cairo/ffi/types/struct")

;;;; End
