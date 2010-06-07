;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/util/package.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package :cairo.util)
    (defpackage :cairo.util
      (:use
       :lisp
       ))))

(provide "cairo/util/package")

;;;; End
