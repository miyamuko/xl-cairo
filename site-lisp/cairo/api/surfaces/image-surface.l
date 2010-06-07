;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/surfaces/image-surface.l
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
  (require "cairo/ffi/surfaces/image-surface")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-format-stride-for-width
          cairo-image-surface-create
          cairo-image-surface-create-for-data
          cairo-image-surface-get-data
          cairo-image-surface-get-format
          cairo-image-surface-get-width
          cairo-image-surface-get-height
          cairo-image-surface-get-stride
          ))


(defun cairo-format-stride-for-width (format width)
  (returning (c:int)
    (with-c-arguments ((cairo.ffi:format-t format)
                       (c:int width))
      (%cairo-format-stride-for-width format width))))

(defun cairo-image-surface-create (format width height)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-c-arguments ((cairo.ffi:format-t format)
                         (c:int width)
                         (c:int height))
        (%cairo-image-surface-create format width height)))))

(defun cairo-image-surface-create-for-data (data format width height stride)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-c-arguments ((cairo.ffi:u_char* data)
                         (cairo.ffi:format-t format)
                         (c:int width)
                         (c:int height)
                         (c:int stride))
        (%cairo-image-surface-create-for-data data format width height stride)))))

(defun cairo-image-surface-get-data (surface)
  (returning (cairo.ffi:u_char*)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-image-surface-get-data surface))))

(defun cairo-image-surface-get-format (surface)
  (returning (cairo.ffi:format-t)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-image-surface-get-format surface))))

(defun cairo-image-surface-get-width (surface)
  (returning (c:int)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-image-surface-get-width surface))))

(defun cairo-image-surface-get-height (surface)
  (returning (c:int)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-image-surface-get-height surface))))

(defun cairo-image-surface-get-stride (surface)
  (returning (c:int)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-image-surface-get-stride surface))))


(provide "cairo/api/surfaces/image-surface")

;;;; End
