;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/drawing/pattern.l
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
  (require "cairo/util/sequence")
  (require "cairo/ffi/drawing/pattern")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-pattern-add-color-stop-rgb
          cairo-pattern-add-color-stop-rgba
          cairo-pattern-create-rgb
          cairo-pattern-create-rgba
          cairo-pattern-get-rgba
          cairo-pattern-create-for-surface
          cairo-pattern-get-surface
          cairo-pattern-create-linear
          cairo-pattern-get-linear-points
          cairo-pattern-create-radial
          cairo-pattern-get-radial-circles
          cairo-pattern-destroy
          cairo-pattern-set-extend
          cairo-pattern-get-extend
          cairo-pattern-set-filter
          cairo-pattern-get-filter
          cairo-pattern-set-matrix
          cairo-pattern-get-matrix
          cairo-pattern-get-type

          cairo-pattern-get-color-stop-rgba-list
          ))


(defun cairo-pattern-add-color-stop-rgb (pattern offset red green blue)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern)
                       (c:double offset)
                       (c:double red)
                       (c:double green)
                       (c:double blue))
      (%cairo-pattern-add-color-stop-rgb pattern offset red green blue))
    (cairo-pattern-status pattern)))

(defun cairo-pattern-add-color-stop-rgba (pattern offset red green blue alpha)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern)
                       (c:double offset)
                       (c:double red)
                       (c:double green)
                       (c:double blue)
                       (c:double alpha))
      (%cairo-pattern-add-color-stop-rgba pattern offset red green blue alpha))
    (cairo-pattern-status pattern)))

(defun cairo-pattern-get-color-stop-count (pattern)
  (with-c-out-values (((c:int count) 0))
    (returning (cairo.ffi:status-t)
      (with-c-arguments ((cairo.ffi:pattern-t* pattern))
        (%cairo-pattern-get-color-stop-count pattern count)))))

(defun cairo-pattern-get-color-stop-rgba (pattern index)
  (with-c-out-values (((c:double offset) 0)
                      ((c:double red) 0)
                      ((c:double green) 0)
                      ((c:double blue) 0)
                      ((c:double alpha) 0))
    (returning (cairo.ffi:status-t)
      (with-c-arguments ((cairo.ffi:pattern-t* pattern)
                         (c:int index))
        (%cairo-pattern-get-color-stop-rgba pattern index offset red green blue alpha)))))

(defun cairo-pattern-create-rgb (red green blue)
  (checking-status-using (cairo-pattern-status)
    (returning (cairo.ffi:pattern-t*)
      (with-c-arguments ((c:double red)
                         (c:double green)
                         (c:double blue))
        (%cairo-pattern-create-rgb red green blue)))))

(defun cairo-pattern-create-rgba (red green blue alpha)
  (checking-status-using (cairo-pattern-status)
    (returning (cairo.ffi:pattern-t*)
      (with-c-arguments ((c:double red)
                         (c:double green)
                         (c:double blue)
                         (c:double alpha))
        (%cairo-pattern-create-rgba red green blue alpha)))))

(defun cairo-pattern-get-rgba (pattern)
  (with-c-out-values (((c:double red) 0)
                      ((c:double green) 0)
                      ((c:double blue) 0)
                      ((c:double alpha) 0))
    (returning (cairo.ffi:status-t)
      (with-c-arguments ((cairo.ffi:pattern-t* pattern))
        (%cairo-pattern-get-rgba pattern red green blue alpha)))))

(defun cairo-pattern-create-for-surface (surface)
  (checking-status-using (cairo-pattern-status)
    (returning (cairo.ffi:pattern-t*)
      (with-c-arguments ((cairo.ffi:surface-t* surface))
        (%cairo-pattern-create-for-surface surface)))))

(defun cairo-pattern-get-surface (pattern)
  (with-c-out-values (((cairo.ffi:surface-t* surface) 0))
    (returning (cairo.ffi:status-t)
      (with-c-arguments ((cairo.ffi:pattern-t* pattern))
        (%cairo-pattern-get-surface pattern surface)))))

(defun cairo-pattern-create-linear (x0 y0 x1 y1)
  (checking-status-using (cairo-pattern-status)
    (returning (cairo.ffi:pattern-t*)
      (with-c-arguments ((c:double x0)
                         (c:double y0)
                         (c:double x1)
                         (c:double y1))
        (%cairo-pattern-create-linear x0 y0 x1 y1)))))

(defun cairo-pattern-get-linear-points (pattern)
  (with-c-out-values (((c:double x0) 0)
                      ((c:double y0) 0)
                      ((c:double x1) 0)
                      ((c:double y1) 0))
    (returning (cairo.ffi:status-t)
      (with-c-arguments ((cairo.ffi:pattern-t* pattern))
        (%cairo-pattern-get-linear-points pattern x0 y0 x1 y1)))))

(defun cairo-pattern-create-radial (cx0 cy0 radius0 cx1 cy1 radius1)
  (checking-status-using (cairo-pattern-status)
    (returning (cairo.ffi:pattern-t*)
      (with-c-arguments ((c:double cx0)
                         (c:double cy0)
                         (c:double radius0)
                         (c:double cx1)
                         (c:double cy1)
                         (c:double radius1))
        (%cairo-pattern-create-radial cx0 cy0 radius0 cx1 cy1 radius1)))))

(defun cairo-pattern-get-radial-circles (pattern)
  (with-c-out-values (((c:double x0) 0)
                      ((c:double y0) 0)
                      ((c:double r0) 0)
                      ((c:double x1) 0)
                      ((c:double y1) 0)
                      ((c:double r1) 0))
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern))
      (%cairo-pattern-get-radial-circles pattern x0 y0 r0 x1 y1 r1)))))

(defun cairo-pattern-reference (pattern)
  (returning (cairo.ffi:pattern-t*)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern))
      (%cairo-pattern-reference pattern))))

(defun cairo-pattern-destroy (pattern)
  (returning (c:void)
    (with-destroy-c-ptr (pattern)
      (with-c-arguments ((cairo.ffi:pattern-t* pattern))
        (%cairo-pattern-destroy pattern)))))

(defun cairo-pattern-status (pattern)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern))
      (%cairo-pattern-status pattern))))

(defun cairo-pattern-set-extend (pattern extend)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern)
                       (cairo.ffi:extend-t extend))
      (%cairo-pattern-set-extend pattern extend))))

(defun cairo-pattern-get-extend (pattern)
  (returning (cairo.ffi:extend-t)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern))
      (%cairo-pattern-get-extend pattern))))

(defun cairo-pattern-set-filter (pattern filter)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern)
                       (cairo.ffi:filter-t filter))
      (%cairo-pattern-set-filter pattern filter))))

(defun cairo-pattern-get-filter (pattern)
  (returning (cairo.ffi:filter-t)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern))
      (%cairo-pattern-get-filter pattern))))

(defun cairo-pattern-set-matrix (pattern matrix)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern)
                       (cairo.ffi:matrix-t* matrix))
      (%cairo-pattern-set-matrix pattern matrix))))

(defun cairo-pattern-get-matrix (pattern)
  (let ((matrix (make-matrix)))
    (with-c-arguments ((cairo.ffi:pattern-t* pattern)
                       (cairo.ffi:matrix-t* matrix))
      (%cairo-pattern-get-matrix pattern matrix))
    (matrix-sync-c->lisp matrix)
    matrix))

(defun cairo-pattern-get-type (pattern)
  (returning (cairo.ffi:pattern-type-t)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern))
      (%cairo-pattern-get-type pattern))))

(defun cairo-pattern-get-reference-count (pattern)
  (returning (c:u_int)
    (with-c-arguments ((cairo.ffi:pattern-t* pattern))
      (%cairo-pattern-get-reference-count pattern))))


;;;; handmade section

(define-destroy-macro with-cairo-pattern
                      cairo-pattern-destroy)

(defun cairo-pattern-get-color-stop-rgba-list (pattern)
  (mapcar #'(lambda (i)
              (multiple-value-list (cairo-pattern-get-color-stop-rgba pattern i)))
          (generate-range 0 (cairo-pattern-get-color-stop-count pattern))))

(defsetf
    cairo-pattern-get-extend
    cairo-pattern-set-extend)

(defsetf
    cairo-pattern-get-filter
    cairo-pattern-set-filter)

(defsetf
    cairo-pattern-get-matrix
    cairo-pattern-set-matrix)


(provide "cairo/api/drawing/pattern")

;;;; End
