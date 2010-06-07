;;;; -*- mode: lisp; package: cairo.util -*-
;;;;
;;;; File: cairo/util/symbol.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/util/package"))

(in-package :cairo.util)

(export '(symbol-join
          symbol-join-to
          symbol-substitute
          subsym
          with-gensyms
          ))

(defun make-string (&rest args)
  (with-output-to-string (s)
    (dolist (o args)
      (princ o s))))

(defun symbol-join-to (pkg &rest args)
  (values (intern (apply 'make-string args) pkg)))

(defun symbol-join (&rest args)
  (values (intern (apply 'make-string args))))

(defun symbol-substitute (newitem olditem symbol)
  (intern (substitute newitem olditem (string symbol))))

(defun subsym (symbol start &optional end)
  (intern (subseq (string symbol) start end)))

(defmacro with-gensyms (syms &body body)
  `(let ,(mapcar #'(lambda (sym)
                     `(,sym (gensym)))
                 syms)
     ,@body))
(setf (get 'with-gensyms 'ed:lisp-indent-hook) 'let)


(provide "cairo/util/symbol")

;;;; End
