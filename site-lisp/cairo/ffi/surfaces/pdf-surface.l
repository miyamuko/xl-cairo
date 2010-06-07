;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/surfaces/pdf-surface.l
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

;; http://www.cairographics.org/manual/cairo-pdf-surface.html#cairo-pdf-surface-create
(define-cairo-api
  surface-t*
  %cairo-pdf-surface-create ((c:char* filename)
                             (c:double width-in-points)
                             (c:double height-in-points)))

;; http://www.cairographics.org/manual/cairo-pdf-surface.html#cairo-pdf-surface-create-for-stream
(define-cairo-api
  surface-t*
  %cairo-pdf-surface-create-for-stream ((write-func-t write-func)
                                        (c:void* closure)
                                        (c:double width-in-points)
                                        (c:double height-in-points)))

;; http://www.cairographics.org/manual/cairo-pdf-surface.html#cairo-pdf-surface-set-size
(define-cairo-api
  c:void
  %cairo-pdf-surface-set-size ((surface-t* surface)
                               (c:double width-in-points)
                               (c:double height-in-points)))



(provide "cairo/ffi/surfaces/pdf-surface")

;;;; End
