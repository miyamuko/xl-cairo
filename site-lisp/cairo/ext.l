;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ext.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(in-package :user)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ext/macro")
  (require "cairo/ext/api")
  )

(provide "cairo/ext")

;;;; End
