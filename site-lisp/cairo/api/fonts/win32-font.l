;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/fonts/win32-font.l
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
  (require "cairo/ffi/fonts/win32-font")
  (require "cairo/ffi/support/types")
  (require "cairo/ffi/win32/kernel32")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-win32-font-face-create-for-logfontw
          cairo-win32-font-face-create-for-hfont
          cairo-win32-font-face-create-for-logfontw-hfont
          cairo-win32-scaled-font-select-font
          cairo-win32-scaled-font-done-font
          cairo-win32-scaled-font-get-metrics-factor
          cairo-win32-scaled-font-get-logical-to-device
          cairo-win32-scaled-font-get-device-to-logical
          ))


(defun cairo-win32-font-face-create-for-logfontw (logfont)
  (returning (cairo.ffi:font-face-t*)
    (with-c-arguments ((cairo.ffi:LOGFONTW* logfont))
      (%cairo-win32-font-face-create-for-logfontw logfont))))

(defun cairo-win32-font-face-create-for-hfont (font)
  (returning (cairo.ffi:font-face-t*)
    (with-c-arguments ((winapi:HFONT font))
      (%cairo-win32-font-face-create-for-hfont font))))

(defun cairo-win32-font-face-create-for-logfontw-hfont (logfont font)
  (returning (cairo.ffi:font-face-t*)
    (with-c-arguments ((cairo.ffi:LOGFONTW* logfont)
                       (winapi:HFONT font))
      (%cairo-win32-font-face-create-for-logfontw-hfont logfont font))))

(defun cairo-win32-scaled-font-select-font (scaled-font hdc)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                       (winapi:HDC hdc))
      (%cairo-win32-scaled-font-select-font scaled-font hdc))))

(defun cairo-win32-scaled-font-done-font (scaled-font)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font))
      (%cairo-win32-scaled-font-done-font scaled-font))))

(defun cairo-win32-scaled-font-get-metrics-factor (scaled-font)
  (with-c-out-values (((c:double out) 0))
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font))
      (%cairo-win32-scaled-font-get-metrics-factor2 scaled-font out))))

(defun cairo-win32-scaled-font-get-logical-to-device (scaled-font)
  (let ((logical-to-device (make-matrix)))
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                       (cairo.ffi:matrix-t* logical-to-device))
      (%cairo-win32-scaled-font-get-logical-to-device scaled-font logical-to-device))
    (matrix-sync-c->lisp logical-to-device)
    logical-to-device))

(defun cairo-win32-scaled-font-get-device-to-logical (scaled-font)
  (let ((device-to-logical (make-matrix)))
    (with-c-arguments ((cairo.ffi:scaled-font-t* scaled-font)
                       (cairo.ffi:matrix-t* device-to-logical))
      (%cairo-win32-scaled-font-get-device-to-logical scaled-font device-to-logical))
    (matrix-sync-c->lisp device-to-logical)
    device-to-logical))


(provide "cairo/api/fonts/win32-font")

;;;; End
