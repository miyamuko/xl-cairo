;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/surfaces/ps-surface.l
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

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-create
(define-cairo-api
  surface-t*
  %cairo-ps-surface-create ((c:char* filename)
                            (c:double width-in-points)
                            (c:double height-in-points)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-create-for-stream
(define-cairo-api
  surface-t*
  %cairo-ps-surface-create-for-stream ((write-func-t write-func)
                                       (c:void* closure)
                                       (c:double width-in-points)
                                       (c:double height-in-points)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-restrict-to-level
(define-cairo-api
  c:void
  %cairo-ps-surface-restrict-to-level ((surface-t* surface)
                                       (ps-level-t level)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-get-levels
(define-cairo-api
  c:void
  %cairo-ps-get-levels ((ps-level-t** levels)
                        (int* num-levels)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-level-to-string
(define-cairo-api
  c:char*
  %cairo-ps-level-to-string ((ps-level-t level)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-set-eps
(define-cairo-api
  c:void
  %cairo-ps-surface-set-eps ((surface-t* surface)
                             (bool-t eps)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-get-eps
(define-cairo-api
  bool-t
  %cairo-ps-surface-get-eps ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-set-size
(define-cairo-api
  c:void
  %cairo-ps-surface-set-size ((surface-t* surface)
                              (c:double width-in-points)
                              (c:double height-in-points)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-dsc-begin-setup
(define-cairo-api
  c:void
  %cairo-ps-surface-dsc-begin-setup ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-dsc-begin-page-setup
(define-cairo-api
  c:void
  %cairo-ps-surface-dsc-begin-page-setup ((surface-t* surface)))

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-surface-dsc-comment
(define-cairo-api
  c:void
  %cairo-ps-surface-dsc-comment ((surface-t* surface)
                                 (c:char* comment)))



(provide "cairo/ffi/surfaces/ps-surface")

;;;; End
