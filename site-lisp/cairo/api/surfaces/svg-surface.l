;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/surfaces/svg-surface.l
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
  (require "cairo/ffi/surfaces/svg-surface")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-svg-surface-create
          cairo-svg-surface-restrict-to-version
          cairo-svg-get-versions
          cairo-svg-version-to-string
          ))


(defun cairo-svg-surface-create (filename width-in-points height-in-points)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-c-arguments ((c:char* filename)
                         (c:double width-in-points)
                         (c:double height-in-points))
        (%cairo-svg-surface-create filename width-in-points height-in-points)))))

(defun cairo-svg-surface-restrict-to-version (surface version)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (cairo.ffi:svg-version-t version))
      (%cairo-svg-surface-restrict-to-version surface version))))

(defun cairo-svg-get-versions ()
  (let ((versions** (make-chunk-for 'svg-version-t*))
        (num-versions* (make-int-chunk)))
    (%cairo-svg-get-versions versions** num-versions*)
    (unpack-array-of-svg-version-t (unpack-chunk-for 'cairo.ffi:svg-version-t* versions**)
                                   (unpack-int num-versions*))))

(defun cairo-svg-version-to-string (version)
  (returning (c:char*)
    (with-c-arguments ((cairo.ffi:svg-version-t version))
      (%cairo-svg-version-to-string version))))


(provide "cairo/api/surfaces/svg-surface")

;;;; End
