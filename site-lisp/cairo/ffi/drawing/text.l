;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/drawing/text.l
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

;; http://www.cairographics.org/manual/cairo-text.html#cairo-select-font-face
(define-cairo-api
  c:void
  %cairo-select-font-face ((cairo-t* cr)
                           (c:char* family)
                           (font-slant-t slant)
                           (font-weight-t weight)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-set-font-size
(define-cairo-api
  c:void
  %cairo-set-font-size ((cairo-t* cr)
                        (c:double size)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-set-font-matrix
(define-cairo-api
  c:void
  %cairo-set-font-matrix ((cairo-t* cr)
                          (matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-get-font-matrix
(define-cairo-api
  c:void
  %cairo-get-font-matrix ((cairo-t* cr)
                          (matrix-t* matrix)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-set-font-options
(define-cairo-api
  c:void
  %cairo-set-font-options ((cairo-t* cr)
                           (font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-get-font-options
(define-cairo-api
  c:void
  %cairo-get-font-options ((cairo-t* cr)
                           (font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-set-font-face
(define-cairo-api
  c:void
  %cairo-set-font-face ((cairo-t* cr)
                        (font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-get-font-face
(define-cairo-api
  font-face-t*
  %cairo-get-font-face ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-set-scaled-font
(define-cairo-api
  c:void
  %cairo-set-scaled-font ((cairo-t* cr)
                          (scaled-font-t* scaled-font)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-get-scaled-font
(define-cairo-api
  scaled-font-t*
  %cairo-get-scaled-font ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-show-text
(define-cairo-api
  c:void
  %cairo-show-text ((cairo-t* cr)
                    (c:char* utf8)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-show-glyphs
(define-cairo-api
  c:void
  %cairo-show-glyphs ((cairo-t* cr)
                      (glyph-t* glyphs)
                      (c:int num-glyphs)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-show-text-glyphs
(define-cairo-api
  c:void
  %cairo-show-text-glyphs ((cairo-t* cr)
                           (c:char* utf8)
                           (c:int utf8-len)
                           (glyph-t* glyphs)
                           (c:int num-glyphs)
                           (text-cluster-t* clusters)
                           (c:int num-clusters)
                           (text-cluster-flags-t cluster-flags)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-font-extents
(define-cairo-api
  c:void
  %cairo-font-extents ((cairo-t* cr)
                       (font-extents-t* extents)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-text-extents
(define-cairo-api
  c:void
  %cairo-text-extents ((cairo-t* cr)
                       (c:char* utf8)
                       (text-extents-t* extents)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-glyph-extents
(define-cairo-api
  c:void
  %cairo-glyph-extents ((cairo-t* cr)
                        (glyph-t* glyphs)
                        (c:int num-glyphs)
                        (text-extents-t* extents)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-toy-font-face-create
(define-cairo-api
  font-face-t*
  %cairo-toy-font-face-create ((c:char* family)
                               (font-slant-t slant)
                               (font-weight-t weight)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-toy-font-face-get-family
(define-cairo-api
  c:char*
  %cairo-toy-font-face-get-family ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-toy-font-face-get-slant
(define-cairo-api
  font-slant-t
  %cairo-toy-font-face-get-slant ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-toy-font-face-get-weight
(define-cairo-api
  font-weight-t
  %cairo-toy-font-face-get-weight ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-glyph-allocate
(define-cairo-api
  glyph-t*
  %cairo-glyph-allocate ((c:int num-glyphs)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-glyph-free
(define-cairo-api
  c:void
  %cairo-glyph-free ((glyph-t* glyphs)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-text-cluster-allocate
(define-cairo-api
  text-cluster-t*
  %cairo-text-cluster-allocate ((c:int num-clusters)))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-text-cluster-free
(define-cairo-api
  c:void
  %cairo-text-cluster-free ((text-cluster-t* clusters)))



(provide "cairo/ffi/drawing/text")

;;;; End
