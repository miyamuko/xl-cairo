;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/api/package.l
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

  (unless (find-package :cairo)
    (defpackage :cairo
      (:nicknames :cairo.api)
      (:use
       :lisp
       :cairo.util :cairo.ffi
       ))))

(provide "cairo/api/package")

;;;; End
