;;;; -*- mode: lisp; package: user -*-
;;;;
;;;; File: cairo/api/fonts.l
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
  (require "cairo/api/fonts/font-face")
  (require "cairo/api/fonts/scaled-font")
  (require "cairo/api/fonts/font-options")
  (require "cairo/api/fonts/win32-font")
  )

(provide "cairo/api/fonts")

;;;; End
