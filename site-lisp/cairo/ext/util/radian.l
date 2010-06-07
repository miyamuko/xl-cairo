;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/util/radian.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ext/package")
  )

(in-package :cairo.ext)

(export '(degree->radian
          radian->degree
          ))

(defun degree->radian (degree)
  (* degree (/ pi 180.0d0)))

(defun radian->degree (radian)
  (* 180.0d0 (/ radian pi)))


(provide "cairo/ext/util/radian")

;;;; End
