;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/util/constants.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ext/package")
  )

(in-package :cairo.ext)

(defconstant 2pi (* 2.0d0 pi))


(provide "cairo/ext/util/constants")

;;;; End
