;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/drawing/text.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/util")
  (require "cairo/ffi/drawing/text")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-select-font-face
          cairo-set-font-size
          cairo-set-font-matrix
          cairo-get-font-matrix
          cairo-set-font-options
          cairo-get-font-options
          cairo-set-font-face
          cairo-get-font-face
          cairo-set-scaled-font
          cairo-get-scaled-font
          cairo-show-text
          cairo-show-glyphs
          cairo-show-text-glyphs
          cairo-font-extents
          cairo-text-extents
          cairo-glyph-extents

          cairo-toy-font-face-create
          cairo-toy-font-face-get-family
          cairo-toy-font-face-get-slant
          cairo-toy-font-face-get-weight

          cairo-font-extents-alist
          cairo-text-extents-alist
          cairo-glyph-extents-alist

          cairo-font-extents-list
          cairo-text-extents-list
          cairo-glyph-extents-list
          ))


(defun cairo-select-font-face (cr family slant weight)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo::utf8-char* family)
                       (cairo.ffi:font-slant-t slant)
                       (cairo.ffi:font-weight-t weight))
      (%cairo-select-font-face cr family slant weight))))

(defun cairo-set-font-size (cr size)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double size))
      (%cairo-set-font-size cr size))))

(defun cairo-set-font-matrix (cr matrix)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:matrix-t* matrix))
      (%cairo-set-font-matrix cr matrix))))

(defun cairo-get-font-matrix (cr)
  (let ((matrix (make-matrix)))
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:matrix-t* matrix))
      (%cairo-get-font-matrix cr matrix))
    (matrix-sync-c->lisp matrix)
    matrix))

(defun cairo-set-font-options (cr options)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:font-options-t* options))
      (%cairo-set-font-options cr options))))

(defun cairo-get-font-options (cr)
  (let ((options (cairo-font-options-create)))
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:font-options-t* options))
      (%cairo-get-font-options cr options))
    options))

(defun cairo-set-font-face (cr font-face)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:font-face-t* font-face))
      (%cairo-set-font-face cr font-face))))

(defun cairo-get-font-face (cr)
  (checking-status-using (cairo-font-face-status)
    (returning (cairo.ffi:font-face-t*)
      (with-c-arguments ((cairo.ffi:cairo-t* cr))
        (%cairo-get-font-face cr)))))

(defun cairo-set-scaled-font (cr scaled-font)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:scaled-font-t* scaled-font))
      (%cairo-set-scaled-font cr scaled-font))))

(defun cairo-get-scaled-font (cr)
  (checking-status-using (cairo-scaled-font-status)
    (returning (cairo.ffi:scaled-font-t*)
      (with-c-arguments ((cairo.ffi:cairo-t* cr))
        (%cairo-get-scaled-font cr)))))

(defun cairo-show-text (cr str)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo::utf8-char* str))
      (%cairo-show-text cr str))))

(defun cairo-show-glyphs (cr glyphs)
  ;; TODO: nil チェック
  (when (atom glyphs)
    (setf glyphs (list glyphs)))
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (dolist (g glyphs)
        (%cairo-show-glyphs cr (glyph-new-chunk-with-check g) 1)))))

;; TODO
(defun cairo-show-text-glyphs (cr str glyphs clusters cluster-flags)
  ;; TODO: nil チェック
  (when (atom glyphs)
    (setf glyphs (list glyphs)))
  (when (atom clusters)
    (setf clusters (list clusters)))
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo::utf8-char* str)
                       (cairo::array-of-glyph-t glyphs)
                       (cairo::array-of-text-cluster-t clusters))
      (%cairo-show-text-glyphs cr
                               str
                               (si:chunk-size str)
                               glyphs
                               (number-of glyphs 'cairo.ffi:glyph-t)
                               clusters
                               (number-of clusters 'cairo.ffi:text-cluster-t)
                               (if cluster-flags
                                   (text-cluster-flags-t-lisp->c cluster-flags)
                                 0))
      )))

(defun cairo-font-extents0 (cr)
  (let ((extents (make-font-extents)))
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:font-extents-t* extents))
      (%cairo-font-extents cr extents))
    (font-extents-sync-c->lisp extents)
    extents))

(defun cairo-text-extents0 (cr str)
  (let ((extents (make-text-extents)))
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo::utf8-char* str)
                       (cairo.ffi:text-extents-t* extents))
      (%cairo-text-extents cr str extents))
    (text-extents-sync-c->lisp extents)
    extents))

(defun cairo-glyph-extents0 (cr glyphs)
  (let ((extents (make-text-extents)))
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo::array-of-glyph-t glyphs)
                       (cairo.ffi:text-extents-t* extents))
      (%cairo-glyph-extents cr
                            glyphs
                            (number-of glyphs 'cairo.ffi:glyph-t)
                            extents))
    (text-extents-sync-c->lisp extents)
    extents))

(defun cairo-toy-font-face-create (family slant weight)
  (checking-status-using (cairo-font-face-status)
    (returning (cairo.ffi:font-face-t*)
      (with-c-arguments ((cairo::utf8-char* family)
                         (cairo.ffi:font-slant-t slant)
                         (cairo.ffi:font-weight-t weight))
        (%cairo-toy-font-face-create family slant weight)))))

(defun cairo-toy-font-face-get-family (font-face)
  (returning (cairo::utf8-char*)
    (with-c-arguments ((cairo.ffi:font-face-t* font-face))
      (%cairo-toy-font-face-get-family font-face))))

(defun cairo-toy-font-face-get-slant (font-face)
  (returning (cairo.ffi:font-slant-t)
    (with-c-arguments ((cairo.ffi:font-face-t* font-face))
      (%cairo-toy-font-face-get-slant font-face))))

(defun cairo-toy-font-face-get-weight (font-face)
  (returning (cairo.ffi:font-weight-t)
    (with-c-arguments ((cairo.ffi:font-face-t* font-face))
      (%cairo-toy-font-face-get-weight font-face))))


;;;; handmade section

(defun cairo-font-extents (cr)
  (font-extents-values (cairo-font-extents0 cr)))

(defun cairo-font-extents-alist (cr)
  (font-extents-to-alist (cairo-font-extents0 cr)))

(defun cairo-font-extents-list (cr)
  (font-extents-to-list (cairo-font-extents0 cr)))


(defun cairo-text-extents (cr str)
  (text-extents-values (cairo-text-extents0 cr str)))

(defun cairo-text-extents-alist (cr str)
  (text-extents-to-alist (cairo-text-extents0 cr str)))

(defun cairo-text-extents-list (cr str)
  (text-extents-to-list (cairo-text-extents0 cr str)))


(defun cairo-glyph-extents (cr glyphs)
  (text-extents-values (cairo-glyph-extents0 cr glyphs)))

(defun cairo-glyph-extents-alist (cr glyphs)
  (text-extents-to-alist (cairo-glyph-extents0 cr glyphs)))

(defun cairo-glyph-extents-list (cr glyphs)
  (text-extents-to-list (cairo-glyph-extents0 cr glyphs)))


(defsetf
    cairo-get-font-matrix
    cairo-set-font-matrix)

(defsetf
    cairo-get-font-options
    cairo-set-font-options)

(defsetf
    cairo-get-font-face
    cairo-set-font-face)

(defsetf
    cairo-get-scaled-font
    cairo-set-scaled-font)


(provide "cairo/api/drawing/text")

;;;; End
