;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/surfaces/ps-surface.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/surfaces/ps-surface")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-ps-surface-create
          cairo-ps-surface-restrict-to-level
          cairo-ps-get-levels
          cairo-ps-level-to-string
          cairo-ps-surface-set-eps
          cairo-ps-surface-get-eps
          cairo-ps-surface-set-size
          cairo-ps-surface-dsc-begin-setup
          cairo-ps-surface-dsc-begin-page-setup
          cairo-ps-surface-dsc-comment
          ))


(defun cairo-ps-surface-create (filename width-in-points height-in-points)
  (returning (cairo.ffi:surface-t*)
    (with-c-arguments ((c:char* filename)
                       (c:double width-in-points)
                       (c:double height-in-points))
      (%cairo-ps-surface-create filename width-in-points height-in-points))))

(defun cairo-ps-surface-restrict-to-level (surface level)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (cairo.ffi:ps-level-t level))
      (%cairo-ps-surface-restrict-to-level surface level))))

(defun cairo-ps-get-levels ()
  (let ((levels** (make-chunk-for 'ps-level-t*))
        (num-levels* (make-int-chunk)))
    (%cairo-ps-get-levels levels** num-levels*)
    (unpack-array-of-ps-level-t (unpack-chunk-for 'ps-level-t* levels**)
                                (unpack-int num-levels*))))

(defun cairo-ps-level-to-string (level)
  (returning (c:char*)
    (with-c-arguments ((cairo.ffi:ps-level-t level))
      (%cairo-ps-level-to-string level))))

(defun cairo-ps-surface-set-eps (surface eps)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (cairo.ffi:bool-t eps))
      (%cairo-ps-surface-set-eps surface eps))))

(defun cairo-ps-surface-get-eps (surface)
  (returning (cairo.ffi:bool-t)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-ps-surface-get-eps surface))))

(defun cairo-ps-surface-set-size (surface width-in-points height-in-points)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (c:double width-in-points)
                       (c:double height-in-points))
      (%cairo-ps-surface-set-size surface width-in-points height-in-points))))

(defun cairo-ps-surface-dsc-begin-setup (surface)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-ps-surface-dsc-begin-setup surface))))

(defun cairo-ps-surface-dsc-begin-page-setup (surface)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (%cairo-ps-surface-dsc-begin-page-setup surface))))

(defun cairo-ps-surface-dsc-comment (surface comment)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (c:char* comment))
      (%cairo-ps-surface-dsc-comment surface comment))))


;;;; handmade section

(defsetf
    cairo-ps-surface-get-eps
    cairo-ps-surface-set-eps)


(provide "cairo/api/surfaces/ps-surface")

;;;; End
