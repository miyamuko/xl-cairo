;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/types/struct.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api/package")
  (require "cairo/api/macros")
  (require "cairo/api/types/base")
  (require "cairo/api/types/enum")
  (require "cairo/api/types/union")
  )


(in-package :cairo)

;;;; Drawing - cairo_t

(define-c-struct-wrapper (rectangle
                          cairo.ffi:rectangle-t))

;; rectangle-list 内の rectangles は配列なので autoboxing はしない。
;; cairo-t.l 内で実装する。
(eval-when (:compile-toplevel :load-toplevel :execute)
  (define-autoboxing-for (cairo.ffi:rectangle-t*)
    :c->lisp 'no-need-to-autoboxing
    :lisp->c 'no-need-to-autoboxing))

(define-c-struct-wrapper (rectangle-list
                          cairo.ffi:rectangle-list-t))

;;;; Drawing - Paths

;; path-t は union.l で。

;;;; Drawing - Text

;;; glyph-t

(define-c-struct-wrapper (glyph
                          cairo.ffi:glyph-t))

(defun pack-array-of-glyph-t (glyphs)
  (pack-c-array 'cairo.ffi:glyph-t
                (mapcar (lisp->c-converter 'cairo.ffi:glyph-t)
                        glyphs)))

(defun unpack-array-of-glyph-t (glyphs* n)
  (mapcar #'make-glyph-from-chunk
          (unpack-c-array 'cairo.ffi:glyph-t
                          glyphs* n)))

(define-autoboxing-for (cairo::array-of-glyph-t)
  :lisp->c 'pack-array-of-glyph-t)

;;; text-cluster-t

(define-c-struct-wrapper (text-cluster
                          cairo.ffi:text-cluster-t))

(defun pack-array-of-text-cluster-t (clusters)
  (pack-c-array 'cairo.ffi:text-cluster-t
                (mapcar (lisp->c-converter 'cairo.ffi:text-cluster-t)
                        clusters)))

(defun unpack-array-of-text-cluster-t (clusters* n)
  (mapcar #'make-text-cluster-from-chunk
          (unpack-c-array 'cairo.ffi:text-cluster-t
                          clusters* n)))

(define-autoboxing-for (cairo::array-of-text-cluster-t)
  :lisp->c 'pack-array-of-text-cluster-t)

;;;; Fonts - Scaled Fonts

(define-c-struct-wrapper (font-extents
                          cairo.ffi:font-extents-t))

(define-c-struct-wrapper (text-extents
                          cairo.ffi:text-extents-t))

;;;; Support - cairo_matrix_t

(define-c-struct-wrapper (matrix
                          cairo.ffi:matrix-t))


(provide "cairo/api/types/struct")

;;;; End
