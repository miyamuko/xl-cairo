;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/api/support.l
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
  (require "cairo/api/support/matrix")
  (require "cairo/api/support/error-status")
  (require "cairo/api/support/version-info")
  (require "cairo/api/support/stream-closure")
  )

(provide "cairo/api/support")

;;;; End
