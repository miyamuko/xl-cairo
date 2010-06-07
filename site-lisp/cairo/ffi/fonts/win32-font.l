;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/fonts/win32-font.l
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

;; http://www.cairographics.org/manual/cairo-win32-font.html#cairo-win32-font-face-create-for-logfontw
(define-cairo-api
  font-face-t*
  %cairo-win32-font-face-create-for-logfontw ((LOGFONTW* logfont)))

;; http://www.cairographics.org/manual/cairo-win32-font.html#cairo-win32-font-face-create-for-hfont
(define-cairo-api
  font-face-t*
  %cairo-win32-font-face-create-for-hfont ((winapi:HFONT font)))

;; http://www.cairographics.org/manual/cairo-win32-font.html#cairo-win32-font-face-create-for-logfontw-hfont
(define-cairo-api
  font-face-t*
  %cairo-win32-font-face-create-for-logfontw-hfont ((LOGFONTW* logfont)
                                                    (winapi:HFONT font)))

;; http://www.cairographics.org/manual/cairo-win32-font.html#cairo-win32-scaled-font-select-font
(define-cairo-api
  status-t
  %cairo-win32-scaled-font-select-font ((scaled-font-t* scaled-font)
                                        (winapi:HDC hdc)))

;; http://www.cairographics.org/manual/cairo-win32-font.html#cairo-win32-scaled-font-done-font
(define-cairo-api
  c:void
  %cairo-win32-scaled-font-done-font ((scaled-font-t* scaled-font)))

;; http://www.cairographics.org/manual/cairo-win32-font.html#cairo-win32-scaled-font-get-metrics-factor
(define-cairo-api
  c:double
  %cairo-win32-scaled-font-get-metrics-factor ((scaled-font-t* scaled-font)))

(define-cairo-api
  c:void
  %cairo-win32-scaled-font-get-metrics-factor2 ((scaled-font-t* scaled-font)
                                                (double* out)))

;; http://www.cairographics.org/manual/cairo-win32-font.html#cairo-win32-scaled-font-get-logical-to-device
(define-cairo-api
  c:void
  %cairo-win32-scaled-font-get-logical-to-device ((scaled-font-t* scaled-font)
                                                  (matrix-t* logical-to-device)))

;; http://www.cairographics.org/manual/cairo-win32-font.html#cairo-win32-scaled-font-get-device-to-logical
(define-cairo-api
  c:void
  %cairo-win32-scaled-font-get-device-to-logical ((scaled-font-t* scaled-font)
                                                  (matrix-t* device-to-logical)))



(provide "cairo/ffi/fonts/win32-font")

;;;; End
