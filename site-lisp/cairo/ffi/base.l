;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/base.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/util/symbol")
  (require "cairo/ffi/package")
  (require "cairo/ffi/dll")
  (require "cairo/ffi/macros")
  )

(in-package :cairo.ffi)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defun cairo-lisp-to-c-function (lname)
    (subsym (symbol-substitute #\_ #\- lname) 1)) ;; skip %
  )

(define-library define-cairo-api
                (cairo-dll)
                'cairo-lisp-to-c-function)


(provide "cairo/ffi/base")

;;;; End
