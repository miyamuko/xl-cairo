;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/surfaces/svg-surface.l
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

;; http://www.cairographics.org/manual/cairo-svg-surface.html#cairo-svg-surface-create
(define-cairo-api
  surface-t*
  %cairo-svg-surface-create ((c:char* filename)
                             (c:double width-in-points)
                             (c:double height-in-points)))

;; http://www.cairographics.org/manual/cairo-svg-surface.html#cairo-svg-surface-create-for-stream
(define-cairo-api
  surface-t*
  %cairo-svg-surface-create-for-stream ((write-func-t write-func)
                                        (c:void* closure)
                                        (c:double width-in-points)
                                        (c:double height-in-points)))

;; http://www.cairographics.org/manual/cairo-svg-surface.html#cairo-svg-surface-restrict-to-version
(define-cairo-api
  c:void
  %cairo-svg-surface-restrict-to-version ((surface-t* surface)
                                          (svg-version-t version)))

;; http://www.cairographics.org/manual/cairo-svg-surface.html#cairo-svg-get-versions
(define-cairo-api
  c:void
  %cairo-svg-get-versions ((svg-version-t** versions)
                           (int* num-versions)))

;; http://www.cairographics.org/manual/cairo-svg-surface.html#cairo-svg-version-to-string
(define-cairo-api
  c:char*
  %cairo-svg-version-to-string ((svg-version-t version)))



(provide "cairo/ffi/surfaces/svg-surface")

;;;; End
