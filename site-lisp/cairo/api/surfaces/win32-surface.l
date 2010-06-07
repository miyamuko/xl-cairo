;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/surfaces/win32-surface.l
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
  (require "cairo/ffi/surfaces/win32-surface")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-win32-surface-create
          cairo-win32-surface-create-with-dib
          cairo-win32-surface-create-with-ddb
          cairo-win32-printing-surface-create
          cairo-win32-surface-get-dc
          cairo-win32-surface-get-image
          ))

;; TODO
;; null-or-returning ‚ð‚â‚ß‚é

(defun cairo-win32-surface-create (hdc)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-c-arguments ((winapi:HDC hdc))
        (%cairo-win32-surface-create hdc)))))

(defun cairo-win32-surface-create-with-dib (format width height)
  (null-or-returning (cairo.ffi:surface-t*)
    (with-c-arguments ((cairo.ffi:format-t format)
                       (c:int width)
                       (c:int height))
      (%cairo-win32-surface-create-with-dib format width height))))

(defun cairo-win32-surface-create-with-ddb (hdc format width height)
  (null-or-returning (cairo.ffi:surface-t*)
    (with-c-arguments ((winapi:HDC hdc)
                       (cairo.ffi:format-t format)
                       (c:int width)
                       (c:int height))
      (%cairo-win32-surface-create-with-ddb hdc format width height))))

(defun cairo-win32-printing-surface-create (hdc)
  (null-or-returning (cairo.ffi:surface-t*)
    (with-c-arguments ((winapi:HDC hdc))
      (%cairo-win32-printing-surface-create hdc))))

(defun cairo-win32-surface-get-dc (surface)
  (null-or-returning (winapi:HDC)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-win32-surface-get-dc surface))))

(defun cairo-win32-surface-get-image (surface)
  (null-or-returning (cairo.ffi:surface-t*)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-win32-surface-get-image surface))))


(provide "cairo/api/surfaces/win32-surface")

;;;; End
