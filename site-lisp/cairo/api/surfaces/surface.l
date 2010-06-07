;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/surfaces/surface.l
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
  (require "cairo/ffi/surfaces/surface")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-surface-create-similar
          cairo-surface-destroy
          cairo-surface-finish
          cairo-surface-flush
          cairo-surface-get-font-options
          cairo-surface-get-content
          cairo-surface-mark-dirty
          cairo-surface-mark-dirty-rectangle
          cairo-surface-set-device-offset
          cairo-surface-get-device-offset
          cairo-surface-set-fallback-resolution
          cairo-surface-get-fallback-resolution
          cairo-surface-get-type
          cairo-surface-copy-page
          cairo-surface-show-page
          cairo-surface-has-show-text-glyphs
          ))


(defun cairo-surface-create-similar (other content width height)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-c-arguments ((cairo.ffi:surface-t* other)
                         (cairo.ffi:content-t content)
                         (c:int width)
                         (c:int height))
        (%cairo-surface-create-similar other content width height)))))

(defun cairo-surface-reference (surface)
  (returning (cairo.ffi:surface-t*)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-reference surface))))

(defun cairo-surface-destroy (surface)
  (returning (c:void)
    (with-destroy-c-ptr (surface)
      (with-c-arguments ((cairo.ffi:surface-t* surface))
        (%cairo-surface-destroy surface)))))

(defun cairo-surface-status (surface)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-status surface))))

(defun cairo-surface-finish (surface)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-finish surface))))

(defun cairo-surface-flush (surface)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-flush surface))))

(defun cairo-surface-get-font-options (surface)
  (let ((options (cairo-font-options-create)))
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (cairo.ffi:font-options-t* options))
      (%cairo-surface-get-font-options surface options))
    options))

(defun cairo-surface-get-content (surface)
  (returning (cairo.ffi:content-t)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-get-content surface))))

(defun cairo-surface-mark-dirty (surface)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-mark-dirty surface))))

(defun cairo-surface-mark-dirty-rectangle (surface x y width height)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (c:int x)
                       (c:int y)
                       (c:int width)
                       (c:int height))
      (%cairo-surface-mark-dirty-rectangle surface x y width height))))

(defun cairo-surface-set-device-offset (surface x-offset y-offset)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (c:double x-offset)
                       (c:double y-offset))
      (%cairo-surface-set-device-offset surface x-offset y-offset))))

(defun cairo-surface-get-device-offset (surface)
  (with-c-out-values (((c:double c-x-offset) 0)
                      ((c:double c-y-offset) 0))
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-get-device-offset surface c-x-offset c-y-offset))))

(defun cairo-surface-set-fallback-resolution (surface x-pixels-per-inch y-pixels-per-inch)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (c:double x-pixels-per-inch)
                       (c:double y-pixels-per-inch))
      (%cairo-surface-set-fallback-resolution surface x-pixels-per-inch y-pixels-per-inch))))

(defun cairo-surface-get-fallback-resolution (surface)
  (with-c-out-values (((c:double x-pixels-per-inch) 0)
                      ((c:double y-pixels-per-inch) 0))
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-get-fallback-resolution surface x-pixels-per-inch y-pixels-per-inch))))

(defun cairo-surface-get-type (surface)
  (returning (cairo.ffi:surface-type-t)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-get-type surface))))

(defun cairo-surface-get-reference-count (surface)
  (returning (c:u_int)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-get-reference-count surface))))

(defun cairo-surface-copy-page (surface)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-copy-page surface))))

(defun cairo-surface-show-page (surface)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-show-page surface))))

(defun cairo-surface-has-show-text-glyphs (surface)
  (returning (cairo.ffi:bool-t)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-surface-has-show-text-glyphs surface))))


;;;; handmade section

(define-destroy-macro with-cairo-surface
                      cairo-surface-destroy)


(provide "cairo/api/surfaces/surface")

;;;; End
