;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/fonts/scaled-font.l
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

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-create
(define-cairo-api
  scaled-font-t*
  %cairo-scaled-font-create ((font-face-t* font-face)
                             (matrix-t* font-matrix)
                             (matrix-t* ctm)
                             (font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-reference
(define-cairo-api
  scaled-font-t*
  %cairo-scaled-font-reference ((scaled-font-t* scaled-font)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-destroy
(define-cairo-api
  c:void
  %cairo-scaled-font-destroy ((scaled-font-t* scaled-font)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-status
(define-cairo-api
  status-t
  %cairo-scaled-font-status ((scaled-font-t* scaled-font)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-extents
(define-cairo-api
  c:void
  %cairo-scaled-font-extents ((scaled-font-t* scaled-font)
                              (font-extents-t* extents)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-text-extents
(define-cairo-api
  c:void
  %cairo-scaled-font-text-extents ((scaled-font-t* scaled-font)
                                   (c:char* utf8)
                                   (text-extents-t* extents)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-glyph-extents
(define-cairo-api
  c:void
  %cairo-scaled-font-glyph-extents ((scaled-font-t* scaled-font)
                                    (glyph-t* glyphs)
                                    (c:int num-glyphs)
                                    (text-extents-t* extents)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-text-to-glyphs
(define-cairo-api
  status-t
  %cairo-scaled-font-text-to-glyphs ((scaled-font-t* scaled-font)
                                     (c:double x)
                                     (c:double y)
                                     (c:char* utf8)
                                     (c:int utf8-len)
                                     (glyph-t** glyphs)
                                     (int* num-glyphs)
                                     (text-cluster-t** clusters)
                                     (int* num-clusters)
                                     (text-cluster-flags-t* cluster-flags)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-get-font-face
(define-cairo-api
  font-face-t*
  %cairo-scaled-font-get-font-face ((scaled-font-t* scaled-font)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-get-font-options
(define-cairo-api
  c:void
  %cairo-scaled-font-get-font-options ((scaled-font-t* scaled-font)
                                       (font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-get-font-matrix
(define-cairo-api
  c:void
  %cairo-scaled-font-get-font-matrix ((scaled-font-t* scaled-font)
                                      (matrix-t* font-matrix)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-get-ctm
(define-cairo-api
  c:void
  %cairo-scaled-font-get-ctm ((scaled-font-t* scaled-font)
                              (matrix-t* ctm)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-get-scale-matrix
(define-cairo-api
  c:void
  %cairo-scaled-font-get-scale-matrix ((scaled-font-t* scaled-font)
                                       (matrix-t* scale-matrix)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-get-type
(define-cairo-api
  font-type-t
  %cairo-scaled-font-get-type ((scaled-font-t* scaled-font)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-get-reference-count
(define-cairo-api
  c:u_int
  %cairo-scaled-font-get-reference-count ((scaled-font-t* scaled-font)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-set-user-data
(define-cairo-api
  status-t
  %cairo-scaled-font-set-user-data ((scaled-font-t* scaled-font)
                                    (user-data-key-t* key)
                                    (c:void* user-data)
                                    (destroy-func-t destroy)))

;; http://www.cairographics.org/manual/cairo-scaled-font.html#cairo-scaled-font-get-user-data
(define-cairo-api
  c:void*
  %cairo-scaled-font-get-user-data ((scaled-font-t* scaled-font)
                                    (user-data-key-t* key)))



(provide "cairo/ffi/fonts/scaled-font")

;;;; End
