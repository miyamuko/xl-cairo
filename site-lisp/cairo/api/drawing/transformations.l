;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/drawing/transformations.l
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
  (require "cairo/ffi/drawing/transformations")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-translate
          cairo-scale
          cairo-rotate
          cairo-transform
          cairo-set-matrix
          cairo-get-matrix
          cairo-identity-matrix
          cairo-user-to-device
          cairo-user-to-device-distance
          cairo-device-to-user
          cairo-device-to-user-distance
          ))


(defun cairo-translate (cr tx ty)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double tx)
                       (c:double ty))
      (%cairo-translate cr tx ty))))

(defun cairo-scale (cr sx sy)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double sx)
                       (c:double sy))
      (%cairo-scale cr sx sy))))

(defun cairo-rotate (cr angle)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double angle))
      (%cairo-rotate cr angle))))

(defun cairo-transform (cr matrix)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:matrix-t* matrix))
      (%cairo-transform cr matrix))))

(defun cairo-set-matrix (cr matrix)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:matrix-t* matrix))
      (%cairo-set-matrix cr matrix))))

(defun cairo-get-matrix (cr)
  (let ((matrix (make-matrix)))
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:matrix-t* matrix))
      (%cairo-get-matrix cr matrix))
    (matrix-sync-c->lisp matrix)
    matrix))

(defun cairo-identity-matrix (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-identity-matrix cr))))

(defun cairo-user-to-device (cr x y)
  (with-c-out-values (((c:double c-x) x)
                      ((c:double c-y) y))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-user-to-device cr c-x c-y))))

(defun cairo-user-to-device-distance (cr dx dy)
  (with-c-out-values (((c:double c-dx) dx)
                      ((c:double c-dy) dy))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-user-to-device-distance cr c-dx c-dy))))

(defun cairo-device-to-user (cr x y)
  (with-c-out-values (((c:double c-x) x)
                      ((c:double c-y) y))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-device-to-user cr c-x c-y))))

(defun cairo-device-to-user-distance (cr dx dy)
  (with-c-out-values (((c:double c-dx) dx)
                      ((c:double c-dy) dy))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-device-to-user-distance cr c-dx c-dy))))


;;;; handmade section

(defsetf
    cairo-get-matrix
    cairo-set-matrix)


(provide "cairo/api/drawing/transformations")

;;;; End
