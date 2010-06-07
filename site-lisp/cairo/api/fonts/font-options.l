;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/fonts/font-options.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/fonts/font-options")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-font-options-create
          cairo-font-options-copy
          cairo-font-options-destroy
          cairo-font-options-merge
          cairo-font-options-hash
          cairo-font-options-equal
          cairo-font-options-set-antialias
          cairo-font-options-get-antialias
          cairo-font-options-set-subpixel-order
          cairo-font-options-get-subpixel-order
          cairo-font-options-set-hint-style
          cairo-font-options-get-hint-style
          cairo-font-options-set-hint-metrics
          cairo-font-options-get-hint-metrics
          ))


(defun cairo-font-options-create ()
  (checking-status-using (cairo-font-options-status)
    (returning (cairo.ffi:font-options-t*)
      (%cairo-font-options-create))))

(defun cairo-font-options-copy (original)
  (returning (cairo.ffi:font-options-t*)
    (with-c-arguments ((cairo.ffi:font-options-t* original))
      (%cairo-font-options-copy original))))

(defun cairo-font-options-destroy (options)
  (returning (c:void)
    (with-destroy-c-ptr (options)
      (with-c-arguments ((cairo.ffi:font-options-t* options))
        (%cairo-font-options-destroy options)))))

(defun cairo-font-options-status (options)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:font-options-t* options))
      (%cairo-font-options-status options))))

(defun cairo-font-options-merge (options other)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:font-options-t* options)
                       (cairo.ffi:font-options-t* other))
      (%cairo-font-options-merge options other))))

(defun cairo-font-options-hash (options)
  (returning (c:u_long)
    (with-c-arguments ((cairo.ffi:font-options-t* options))
      (%cairo-font-options-hash options))))

(defun cairo-font-options-equal (options other)
  (returning (cairo.ffi:bool-t)
    (with-c-arguments ((cairo.ffi:font-options-t* options)
                       (cairo.ffi:font-options-t* other))
      (%cairo-font-options-equal options other))))

(defun cairo-font-options-set-antialias (options antialias)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:font-options-t* options)
                       (cairo.ffi:antialias-t antialias))
      (%cairo-font-options-set-antialias options antialias))))

(defun cairo-font-options-get-antialias (options)
  (returning (cairo.ffi:antialias-t)
    (with-c-arguments ((cairo.ffi:font-options-t* options))
      (%cairo-font-options-get-antialias options))))

(defun cairo-font-options-set-subpixel-order (options subpixel-order)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:font-options-t* options)
                       (cairo.ffi:subpixel-order-t subpixel-order))
      (%cairo-font-options-set-subpixel-order options subpixel-order))))

(defun cairo-font-options-get-subpixel-order (options)
  (returning (cairo.ffi:subpixel-order-t)
    (with-c-arguments ((cairo.ffi:font-options-t* options))
      (%cairo-font-options-get-subpixel-order options))))

(defun cairo-font-options-set-hint-style (options hint-style)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:font-options-t* options)
                       (cairo.ffi:hint-style-t hint-style))
      (%cairo-font-options-set-hint-style options hint-style))))

(defun cairo-font-options-get-hint-style (options)
  (returning (cairo.ffi:hint-style-t)
    (with-c-arguments ((cairo.ffi:font-options-t* options))
      (%cairo-font-options-get-hint-style options))))

(defun cairo-font-options-set-hint-metrics (options hint-metrics)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:font-options-t* options)
                       (cairo.ffi:hint-metrics-t hint-metrics))
      (%cairo-font-options-set-hint-metrics options hint-metrics))))

(defun cairo-font-options-get-hint-metrics (options)
  (returning (cairo.ffi:hint-metrics-t)
    (with-c-arguments ((cairo.ffi:font-options-t* options))
      (%cairo-font-options-get-hint-metrics options))))


;;;; handmade section

(define-destroy-macro with-cairo-font-options
                      cairo-font-options-destroy)

(defsetf
    cairo-font-options-get-antialias
    cairo-font-options-set-antialias)

(defsetf
    cairo-font-options-get-subpixel-order
    cairo-font-options-set-subpixel-order)

(defsetf
    cairo-font-options-get-hint-style
    cairo-font-options-set-hint-style)

(defsetf
    cairo-font-options-get-hint-metrics
    cairo-font-options-set-hint-metrics)


(provide "cairo/api/fonts/font-options")

;;;; End
