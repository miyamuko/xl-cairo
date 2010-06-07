;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/fonts/font-options.l
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

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-create
(define-cairo-api
  font-options-t*
  %cairo-font-options-create ())

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-copy
(define-cairo-api
  font-options-t*
  %cairo-font-options-copy ((font-options-t* original)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-destroy
(define-cairo-api
  c:void
  %cairo-font-options-destroy ((font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-status
(define-cairo-api
  status-t
  %cairo-font-options-status ((font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-merge
(define-cairo-api
  c:void
  %cairo-font-options-merge ((font-options-t* options)
                             (font-options-t* other)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-hash
(define-cairo-api
  c:u_long
  %cairo-font-options-hash ((font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-equal
(define-cairo-api
  bool-t
  %cairo-font-options-equal ((font-options-t* options)
                             (font-options-t* other)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-set-antialias
(define-cairo-api
  c:void
  %cairo-font-options-set-antialias ((font-options-t* options)
                                     (antialias-t antialias)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-get-antialias
(define-cairo-api
  antialias-t
  %cairo-font-options-get-antialias ((font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-set-subpixel-order
(define-cairo-api
  c:void
  %cairo-font-options-set-subpixel-order ((font-options-t* options)
                                          (subpixel-order-t subpixel-order)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-get-subpixel-order
(define-cairo-api
  subpixel-order-t
  %cairo-font-options-get-subpixel-order ((font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-set-hint-style
(define-cairo-api
  c:void
  %cairo-font-options-set-hint-style ((font-options-t* options)
                                      (hint-style-t hint-style)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-get-hint-style
(define-cairo-api
  hint-style-t
  %cairo-font-options-get-hint-style ((font-options-t* options)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-set-hint-metrics
(define-cairo-api
  c:void
  %cairo-font-options-set-hint-metrics ((font-options-t* options)
                                        (hint-metrics-t hint-metrics)))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-font-options-get-hint-metrics
(define-cairo-api
  hint-metrics-t
  %cairo-font-options-get-hint-metrics ((font-options-t* options)))



(provide "cairo/ffi/fonts/font-options")

;;;; End
