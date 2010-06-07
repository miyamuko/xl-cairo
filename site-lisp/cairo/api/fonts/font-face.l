;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/fonts/font-face.l
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
  (require "cairo/ffi/fonts/font-face")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-font-face-destroy
          cairo-font-face-get-type
          ))


(defun cairo-font-face-reference (font-face)
  (returning (cairo.ffi:font-face-t*)
    (with-c-arguments ((cairo.ffi:font-face-t* font-face))
      (%cairo-font-face-reference font-face))))

(defun cairo-font-face-destroy (font-face)
  (returning (c:void)
    (with-destroy-c-ptr (font-face)
      (with-c-arguments ((cairo.ffi:font-face-t* font-face))
        (%cairo-font-face-destroy font-face)))))

(defun cairo-font-face-status (font-face)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:font-face-t* font-face))
      (%cairo-font-face-status font-face))))

(defun cairo-font-face-get-type (font-face)
  (returning (cairo.ffi:font-type-t)
    (with-c-arguments ((cairo.ffi:font-face-t* font-face))
      (%cairo-font-face-get-type font-face))))

(defun cairo-font-face-get-reference-count (font-face)
  (returning (c:u_int)
    (with-c-arguments ((cairo.ffi:font-face-t* font-face))
      (%cairo-font-face-get-reference-count font-face))))


;;;; handmade section

(define-destroy-macro with-cairo-font-face
                      cairo-font-face-destroy)


(provide "cairo/api/fonts/font-face")

;;;; End
