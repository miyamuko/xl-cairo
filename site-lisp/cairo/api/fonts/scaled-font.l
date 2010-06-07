;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/fonts/scaled-font.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/fonts/scaled-font")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-scaled-font-create
          cairo-scaled-font-destroy
          cairo-scaled-font-extents
          cairo-scaled-font-text-extents
          cairo-scaled-font-glyph-extents
          cairo-scaled-font-text-to-glyphs
          cairo-scaled-font-get-font-face
          cairo-scaled-font-get-font-options
          cairo-scaled-font-get-font-matrix
          cairo-scaled-font-get-ctm
          cairo-scaled-font-get-scale-matrix
          cairo-scaled-font-get-type

          cairo-scaled-font-extents-list
          cairo-scaled-font-text-extents-list
          cairo-scaled-font-glyph-extents-list

          cairo-scaled-font-extents-alist
          cairo-scaled-font-text-extents-alist
          cairo-scaled-font-glyph-extents-alist
          ))


(defun cairo-scaled-font-create (font-face font-matrix ctm options)
  (checking-status-using (cairo-scaled-font-status)
    (returning (cairo.ffi:scaled-font-t*)
      (with-c-arguments ((cairo.ffi:font-face-t* font-face)
                         (cairo.ffi:matrix-t* font-matrix)
                         (cairo.ffi:matrix-t* ctm)
                         (cairo.ffi:font-options-t* options))
        (%cairo-scaled-font-create font-face font-matrix ctm options)))))

(defun cairo-scaled-font-reference (scaled-font)
  (returning (cairo.ffi:scaled-font-t*)
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font))
      (%cairo-scaled-font-reference scaled-font))))

(defun cairo-scaled-font-destroy (scaled-font)
  (returning (c:void)
    (with-destroy-c-ptr (scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font))
        (%cairo-scaled-font-destroy scaled-font)))))

(defun cairo-scaled-font-status (scaled-font)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font))
      (%cairo-scaled-font-status scaled-font))))

(defun cairo-scaled-font-extents0 (scaled-font)
  (let ((extents (make-font-extents)))
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                         (cairo.ffi:font-extents-t* extents))
        (%cairo-scaled-font-extents scaled-font extents)))
    (font-extents-sync-c->lisp extents)
    extents))

(defun cairo-scaled-font-text-extents0 (scaled-font str)
  (let ((extents (make-text-extents)))
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                         (cairo::utf8-char* str)
                         (cairo.ffi:text-extents-t* extents))
        (%cairo-scaled-font-text-extents scaled-font str extents)))
    (text-extents-sync-c->lisp extents)
    extents))

(defun cairo-scaled-font-glyph-extents0 (scaled-font
                                         glyphs)
  (let ((extents (make-text-extents)))
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                         (cairo::array-of-glyph-t glyphs)
                         (cairo.ffi:text-extents-t* extents))
        (%cairo-scaled-font-glyph-extents scaled-font
                                          glyphs
                                          (number-of glyphs 'cairo.ffi:glyph-t)
                                          extents)))
    (text-extents-sync-c->lisp extents)
    extents))

(defun cairo-scaled-font-text-to-glyphs (scaled-font x y str)
  (let ((glyphs** (make-chunk-for 'glyph-t*))
        (num-glyphs* (make-int-chunk 0))
        (clusters** (make-chunk-for 'text-cluster-t*))
        (num-clusters* (make-int-chunk 0))
        (cluster-flags* (make-chunk-for 'text-cluster-flags-t)))
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                       (cairo::utf8-char* str))
      (raise-error-if-cairo-status-is-not-success
       (%cairo-scaled-font-text-to-glyphs scaled-font x y
                                          str (si:chunk-size str)
                                          glyphs** num-glyphs*
                                          clusters** num-clusters*
                                          cluster-flags*)))
    (let ((num-glyphs (unpack-int num-glyphs*))
          (num-clusters (unpack-int num-clusters*)))
      (unwind-protect
          (values (unpack-array-of-glyph-t
                   (unpack-chunk-for 'glyph-t* glyphs**) num-glyphs)
                  (unpack-array-of-text-cluster-t
                   (unpack-chunk-for 'text-cluster-t* clusters**) num-clusters)
                  (unpack-text-cluster-flags cluster-flags*))
        (progn
          (when (<= 0 num-glyphs)
            (%cairo-glyph-free glyphs**))
          (when (<= 0 num-glyphs)
            (%cairo-text-cluster-free clusters**)))))))

(defun cairo-scaled-font-get-font-face (scaled-font)
  (returning (cairo.ffi:font-face-t*)
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font))
        (%cairo-scaled-font-get-font-face scaled-font)))))

(defun cairo-scaled-font-get-font-options (scaled-font)
  (let ((options (cairo-font-options-create)))
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                         (cairo.ffi:font-options-t* options))
        (%cairo-scaled-font-get-font-options scaled-font options)))
    options))

(defun cairo-scaled-font-get-font-matrix (scaled-font)
  (let ((font-matrix (make-matrix)))
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                         (cairo.ffi:matrix-t* font-matrix))
        (%cairo-scaled-font-get-font-matrix scaled-font font-matrix)))
    (matrix-sync-c->lisp font-matrix)
    font-matrix))

(defun cairo-scaled-font-get-ctm (scaled-font)
  (let ((ctm (make-matrix)))
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                         (cairo.ffi:matrix-t* ctm))
        (%cairo-scaled-font-get-ctm scaled-font ctm)))
    (matrix-sync-c->lisp ctm)
    ctm))

(defun cairo-scaled-font-get-scale-matrix (scaled-font)
  (let ((scale-matrix (make-matrix)))
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                         (cairo.ffi:matrix-t* scale-matrix))
        (%cairo-scaled-font-get-scale-matrix scaled-font scale-matrix)))
    (matrix-sync-c->lisp scale-matrix)
    scale-matrix))

(defun cairo-scaled-font-get-type (scaled-font)
  (returning (cairo.ffi:font-type-t)
    (checking-status-using (cairo-scaled-font-status scaled-font)
      (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font))
        (%cairo-scaled-font-get-type scaled-font)))))

(defun cairo-scaled-font-get-reference-count (scaled-font)
  (returning (c:u_int)
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font))
      (%cairo-scaled-font-get-reference-count scaled-font))))


;;;; handmade section

(define-destroy-macro with-cairo-scaled-font
                      cairo-scaled-font-destroy)

(defun cairo-scaled-font-extents (scaled-font)
  (font-extents-values (cairo-scaled-font-extents0 scaled-font)))

(defun cairo-scaled-font-extents-list (scaled-font)
  (font-extents-to-list (cairo-scaled-font-extents0 scaled-font)))

(defun cairo-scaled-font-extents-alist (scaled-font)
  (font-extents-to-alist (cairo-scaled-font-extents0 scaled-font)))


(defun cairo-scaled-font-text-extents (scaled-font str)
  (text-extents-values (cairo-scaled-font-text-extents0 scaled-font str)))

(defun cairo-scaled-font-text-extents-list (scaled-font str)
  (text-extents-to-list (cairo-scaled-font-text-extents0 scaled-font str)))

(defun cairo-scaled-font-text-extents-alist (scaled-font str)
  (text-extents-to-alist (cairo-scaled-font-text-extents0 scaled-font str)))


(defun cairo-scaled-font-glyph-extents (scaled-font glyphs)
  (text-extents-values (cairo-scaled-font-glyph-extents0 scaled-font glyphs)))

(defun cairo-scaled-font-glyph-extents-list (scaled-font glyphs)
  (text-extents-to-list (cairo-scaled-font-glyph-extents0 scaled-font glyphs)))

(defun cairo-scaled-font-glyph-extents-alist (scaled-font glyphs)
  (text-extents-to-alist (cairo-scaled-font-glyph-extents0 scaled-font glyphs)))


(provide "cairo/api/fonts/scaled-font")

;;;; End
