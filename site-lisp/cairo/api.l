;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/api.l
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
  (require "cairo/api/conditions")

  (require "cairo/api/types")
  (require "cairo/api/support")
  (require "cairo/api/drawing")
  (require "cairo/api/fonts")
  (require "cairo/api/surfaces")

  (require "cairo/api/version")
  )

(provide "cairo/api")

;;;; End
