;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/util/point.l
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

(defun distance (xy1 xy2)
  (sqrt (reduce #'+
                (mapcar #'(lambda (v1 v2)
                            (expt (- v1 v2) 2))
                        xy1 xy2))))


(provide "cairo/ext/util/point")

;;;; End
