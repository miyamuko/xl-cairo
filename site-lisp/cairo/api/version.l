;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/version.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api/package")
  (require "cairo/api/support/version-info")
  )

(in-package :cairo)

(export '(cairo-xyzzy-binding-version
          cairo-version-encode
          cairo-version-list
          cairo-version-major
          cairo-version-minor
          cairo-version-micro
          ))

(defconstant *cairo-xyzzy-binding-version* "1.8.0")

(defun cairo-xyzzy-binding-version ()
  *cairo-xyzzy-binding-version*)

(defun cairo-version-encode (major minor micro)
  (+ (* major (expt 100 2))
     (* minor (expt 100 1))
     (* micro (expt 100 0))))


(defun cairo-version-list ()
  (labels ((div (a b)
             (values (truncate (/ a b))))
           (ver (n i)
             (let* ((base 100)
                    (high (expt base (1+ i))))
               (div (- n (* (div n high) high))
                    (expt base i)))))
    (let ((number (cairo-version)))
      (mapcar #'(lambda (i)
                  (ver number i))
              '(2 1 0)))))

(defun cairo-version-major ()
  (first (cairo-version-list)))

(defun cairo-version-minor ()
  (second (cairo-version-list)))

(defun cairo-version-micro ()
  (third (cairo-version-list)))


(provide "cairo/api/version")

;;;; End
