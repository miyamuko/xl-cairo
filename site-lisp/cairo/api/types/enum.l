;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/types/enum.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api/package")
  (require "cairo/api/macros")
  (require "cairo/api/types/base")
  )


(in-package :cairo)

;; cairo.ffi から import した c enum の定数を cairo パッケージからも export する。
(do-external-symbols (sym 'cairo.ffi)
  (when (eq (get sym 'cairo.ffi::foreign-type) 'cairo.ffi::c-enum-const)
    (export sym)))


;;;; Drawing - cairo_t

(define-autoboxing-for-c-enum cairo.ffi:antialias-t)

(define-autoboxing-for-c-enum cairo.ffi:fill-rule-t)

(define-autoboxing-for-c-enum cairo.ffi:line-cap-t)

(define-autoboxing-for-c-enum cairo.ffi:line-join-t)

(define-autoboxing-for-c-enum cairo.ffi:operator-t)

;;;; Drawing - Paths

(define-autoboxing-for-c-enum cairo.ffi:path-data-type-t)

;;;; Drawing - Patterns

(define-autoboxing-for-c-enum cairo.ffi:extend-t)

(define-autoboxing-for-c-enum cairo.ffi:filter-t)

(define-autoboxing-for-c-enum cairo.ffi:pattern-type-t)

;;;; Drawing - Text

(define-autoboxing-for-c-enum cairo.ffi:font-slant-t)

(define-autoboxing-for-c-enum cairo.ffi:font-weight-t)

(define-autoboxing-for-c-enum cairo.ffi:text-cluster-flags-t)

(defun unpack-text-cluster-flags (cluster-flags*)
  (let ((v (unpack-chunk-for 'text-cluster-flags-t cluster-flags*)))
    (if (zerop v)
        nil
      (text-cluster-flags-t-c->lisp v))))

;;;; Fonts - cairo_font_face_t

(define-autoboxing-for-c-enum cairo.ffi:font-type-t)

;;;; Fonts - Font Options

(define-autoboxing-for-c-enum cairo.ffi:subpixel-order-t)

(define-autoboxing-for-c-enum cairo.ffi:hint-style-t)

(define-autoboxing-for-c-enum cairo.ffi:hint-metrics-t)

;;;; Surfaces - cairo_surface_t

(define-autoboxing-for-c-enum cairo.ffi:content-t)

(define-autoboxing-for-c-enum cairo.ffi:surface-type-t)

;;;; Surfaces - Image Surfaces

(define-autoboxing-for-c-enum cairo.ffi:format-t)

;;;; Surfaces - PostScript Surfaces

(define-autoboxing-for-c-enum cairo.ffi:ps-level-t)

(defun unpack-array-of-ps-level-t (levels* n)
  (mapcar (c->lisp-converter 'ps-level-t)
          (unpack-c-array 'ps-level-t
                          levels* n)))


;;;; Surfaces - SVG Surfaces

(define-autoboxing-for-c-enum cairo.ffi:svg-version-t)

(defun unpack-array-of-svg-version-t (versions* n)
  (mapcar (c->lisp-converter 'cairo.ffi:svg-version-t)
          (unpack-c-array 'cairo.ffi:svg-version-t
                          versions* n)))

;;;; Support - Error handling

(define-autoboxing-for-c-enum cairo.ffi:status-t)


(provide "cairo/api/types/enum")

;;;; End
