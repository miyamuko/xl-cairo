;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/surfaces/win32-surface.l
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

;; http://www.cairographics.org/manual/cairo-win32-surface.html#cairo-win32-surface-create
(define-cairo-api
  surface-t*
  %cairo-win32-surface-create ((winapi:HDC hdc)))

;; http://www.cairographics.org/manual/cairo-win32-surface.html#cairo-win32-surface-create-with-dib
(define-cairo-api
  surface-t*
  %cairo-win32-surface-create-with-dib ((format-t format)
                                        (c:int width)
                                        (c:int height)))

;; http://www.cairographics.org/manual/cairo-win32-surface.html#cairo-win32-surface-create-with-ddb
(define-cairo-api
  surface-t*
  %cairo-win32-surface-create-with-ddb ((winapi:HDC hdc)
                                        (format-t format)
                                        (c:int width)
                                        (c:int height)))

;; http://www.cairographics.org/manual/cairo-win32-surface.html#cairo-win32-printing-surface-create
(define-cairo-api
  surface-t*
  %cairo-win32-printing-surface-create ((winapi:HDC hdc)))

;; http://www.cairographics.org/manual/cairo-win32-surface.html#cairo-win32-surface-get-dc
(define-cairo-api
  winapi:HDC
  %cairo-win32-surface-get-dc ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-win32-surface.html#cairo-win32-surface-get-image
(define-cairo-api
  surface-t*
  %cairo-win32-surface-get-image ((surface-t* surface)))



(provide "cairo/ffi/surfaces/win32-surface")

;;;; End
