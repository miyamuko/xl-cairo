;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(in-package :user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi")
  (require "cairo/api")
  (require "cairo/ext")
  )

(provide "cairo")

;;;; End
