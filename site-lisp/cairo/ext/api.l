;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/ext/api.l
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
  (require "cairo/ext/api/drawing")
  (require "cairo/ext/api/fonts")
  )

(provide "cairo/ext/api")

;;;; End
