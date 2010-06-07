;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/support/version-info.l
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
  (require "cairo/ffi/support/version-info")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-version
          cairo-version-string
          ))


(defun cairo-version ()
  (returning (c:int)
    (%cairo-version)))

(defun cairo-version-string ()
  (returning (c:char*)
    (%cairo-version-string)))


(provide "cairo/api/support/version-info")

;;;; End
