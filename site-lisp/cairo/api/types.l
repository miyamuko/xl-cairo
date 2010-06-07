;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/api/types.l
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
  (require "cairo/api/types/base")
  (require "cairo/api/types/typedef")
  (require "cairo/api/types/enum")
  (require "cairo/api/types/struct")
  (require "cairo/api/types/union")
  )

(provide "cairo/api/types")

;;;; End
