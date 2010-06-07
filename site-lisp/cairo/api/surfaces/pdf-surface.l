;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/surfaces/pdf-surface.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: full
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/surfaces/pdf-surface")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-pdf-surface-create
          cairo-pdf-surface-set-size
          ))


(defun cairo-pdf-surface-create (filename width-in-points height-in-points)
  (returning (cairo.ffi:surface-t*)
    (with-c-arguments ((c:char* filename)
                       (c:double width-in-points)
                       (c:double height-in-points))
      (%cairo-pdf-surface-create filename width-in-points height-in-points))))

(defun cairo-pdf-surface-set-size (surface width-in-points height-in-points)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (c:double width-in-points)
                       (c:double height-in-points))
      (%cairo-pdf-surface-set-size surface width-in-points height-in-points))))


(provide "cairo/api/surfaces/pdf-surface")

;;;; End
