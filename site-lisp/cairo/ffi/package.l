;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ffi/package.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "foreign")
  (require "wip/winapi")
  (require "cairo/util/package")

  (unless (find-package :cairo.ffi)
    (defpackage :cairo.ffi
      (:use
       :lisp :foreign :winapi
       :cairo.util
       ))))

(provide "cairo/ffi/package")

;;;; End
