;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ext/package.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/util/package")
  (require "cairo/ffi/package")
  (require "cairo/api/package")

  (unless (find-package :cairo.ext)
    (defpackage :cairo.ext
      (:use
       :lisp
       :cairo.util :cairo.ffi :cairo
       ))))

(provide "cairo/ext/package")

;;;; End
