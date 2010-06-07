;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/support/matrix.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/support/matrix")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-matrix-init
          cairo-matrix-init-identity
          cairo-matrix-init-translate
          cairo-matrix-init-scale
          cairo-matrix-init-rotate
          cairo-matrix-translate
          cairo-matrix-scale
          cairo-matrix-rotate
          cairo-matrix-invert
          cairo-matrix-multiply
          cairo-matrix-transform-distance
          cairo-matrix-transform-point
          ))


(defun cairo-matrix-init (xx yx xy yy x0 y0)
  (let ((matrix (make-matrix)))
    (with-c-arguments ((cairo.ffi:matrix-t* matrix)
                       (c:double xx)
                       (c:double yx)
                       (c:double xy)
                       (c:double yy)
                       (c:double x0)
                       (c:double y0))
      (%cairo-matrix-init matrix xx yx xy yy x0 y0))
    (matrix-sync-c->lisp matrix)
    matrix))

(defun cairo-matrix-init-identity ()
  (let ((matrix (make-matrix)))
    (with-c-arguments ((cairo.ffi:matrix-t* matrix))
      (%cairo-matrix-init-identity matrix))
    (matrix-sync-c->lisp matrix)
    matrix))

(defun cairo-matrix-init-translate (tx ty)
  (let ((matrix (make-matrix)))
    (with-c-arguments ((cairo.ffi:matrix-t* matrix)
                       (c:double tx)
                       (c:double ty))
      (%cairo-matrix-init-translate matrix tx ty))
    (matrix-sync-c->lisp matrix)
    matrix))

(defun cairo-matrix-init-scale (sx sy)
  (let ((matrix (make-matrix)))
    (with-c-arguments ((cairo.ffi:matrix-t* matrix)
                       (c:double sx)
                       (c:double sy))
      (%cairo-matrix-init-scale matrix sx sy))
    (matrix-sync-c->lisp matrix)
    matrix))

(defun cairo-matrix-init-rotate (radians)
  (let ((matrix (make-matrix)))
    (with-c-arguments ((cairo.ffi:matrix-t* matrix)
                       (c:double radians))
      (%cairo-matrix-init-rotate matrix radians))
    (matrix-sync-c->lisp matrix)
    matrix))

(defun cairo-matrix-translate (matrix tx ty)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:matrix-t* matrix)
                       (c:double tx)
                       (c:double ty))
      (%cairo-matrix-translate matrix tx ty))))

(defun cairo-matrix-scale (matrix sx sy)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:matrix-t* matrix)
                       (c:double sx)
                       (c:double sy))
      (%cairo-matrix-scale matrix sx sy))))

(defun cairo-matrix-rotate (matrix radians)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:matrix-t* matrix)
                       (c:double radians))
      (%cairo-matrix-rotate matrix radians))))

(defun cairo-matrix-invert (matrix)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:matrix-t* matrix))
      (%cairo-matrix-invert matrix))))

(defun cairo-matrix-multiply (a b)
  (let ((result (make-matrix)))
    (with-c-arguments ((cairo.ffi:matrix-t* result)
                       (cairo.ffi:matrix-t* a)
                       (cairo.ffi:matrix-t* b))
      (%cairo-matrix-multiply result a b))
    (matrix-sync-c->lisp result)
    result))

(defun cairo-matrix-transform-distance (matrix dx dy)
  (with-c-out-values (((c:double dx) dx)
                      ((c:double dy) dy))
    (with-c-arguments ((cairo.ffi:matrix-t* matrix))
      (%cairo-matrix-transform-distance matrix dx dy))))

(defun cairo-matrix-transform-point (matrix x y)
  (with-c-out-values (((c:double x) x)
                      ((c:double y) y))
    (with-c-arguments ((cairo.ffi:matrix-t* matrix))
      (%cairo-matrix-transform-point matrix x y))))


(provide "cairo/api/support/matrix")

;;;; End
