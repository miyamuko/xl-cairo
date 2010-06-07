;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/api/surfaces.l
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
  (require "cairo/api/surfaces/surface")
  (require "cairo/api/surfaces/image-surface")
  (require "cairo/api/surfaces/png-functions")
  (require "cairo/api/surfaces/svg-surface")
  (require "cairo/api/surfaces/pdf-surface")
  (require "cairo/api/surfaces/ps-surface")
  (require "cairo/api/surfaces/win32-surface")
  )

(provide "cairo/api/surfaces")

;;;; End
