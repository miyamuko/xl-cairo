;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/fonts/user-font.l
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

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-scaled-font-init-func-t
(define-callback-function
  status-t
  user-scaled-font-init-func-t ((scaled-font-t* scaled-font)
                                (cairo-t* cr)
                                (font-extents-t* extents)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-scaled-font-render-glyph-func-t
(define-callback-function
  status-t
  user-scaled-font-render-glyph-func-t ((scaled-font-t* scaled-font)
                                        (c:u_long glyph)
                                        (cairo-t* cr)
                                        (text-extents-t* extents)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-scaled-font-text-to-glyphs-func-t
(define-callback-function
  status-t
  user-scaled-font-text-to-glyphs-func-t ((scaled-font-t* scaled-font)
                                          (c:char* utf8)
                                          (c:int utf8-len)
                                          (glyph-t** glyphs)
                                          (int* num-glyphs)
                                          (text-cluster-t** clusters)
                                          (int* num-clusters)
                                          (text-cluster-flags-t* cluster-flags)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-scaled-font-unicode-to-glyph-func-t
(define-callback-function
  status-t
  user-scaled-font-unicode-to-glyph-func-t ((scaled-font-t* scaled-font)
                                            (c:u_long unicode)
                                            (u_long* glyph-index)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-create
(define-cairo-api
  font-face-t*
  %cairo-user-font-face-create ())

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-set-init-func
(define-cairo-api
  c:void
  %cairo-user-font-face-set-init-func ((font-face-t* font-face)
                                       (user-scaled-font-init-func-t init-func)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-get-init-func
(define-cairo-api
  user-scaled-font-init-func-t
  %cairo-user-font-face-get-init-func ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-set-render-glyph-func
(define-cairo-api
  c:void
  %cairo-user-font-face-set-render-glyph-func ((font-face-t* font-face)
                                               (user-scaled-font-render-glyph-func-t render-glyph-func)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-get-render-glyph-func
(define-cairo-api
  user-scaled-font-render-glyph-func-t
  %cairo-user-font-face-get-render-glyph-func ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-set-unicode-to-glyph-func
(define-cairo-api
  c:void
  %cairo-user-font-face-set-unicode-to-glyph-func ((font-face-t* font-face)
                                                   (user-scaled-font-unicode-to-glyph-func-t unicode-to-glyph-func)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-get-unicode-to-glyph-func
(define-cairo-api
  user-scaled-font-unicode-to-glyph-func-t
  %cairo-user-font-face-get-unicode-to-glyph-func ((font-face-t* font-face)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-set-text-to-glyphs-func
(define-cairo-api
  c:void
  %cairo-user-font-face-set-text-to-glyphs-func ((font-face-t* font-face)
                                                 (user-scaled-font-text-to-glyphs-func-t text-to-glyphs-func)))

;; http://www.cairographics.org/manual/cairo-user-font.html#cairo-user-font-face-get-text-to-glyphs-func
(define-cairo-api
  user-scaled-font-text-to-glyphs-func-t
  %cairo-user-font-face-get-text-to-glyphs-func ((font-face-t* font-face)))



(provide "cairo/ffi/fonts/user-font")

;;;; End
