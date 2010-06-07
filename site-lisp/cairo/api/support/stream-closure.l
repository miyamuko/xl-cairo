;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/support/stream-closure.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api/package")
  )

(in-package :cairo)

(defstruct stream-closure
  read-func write-func error)

(defvar *stream-closure-key* 0)
(defvar *stream-closure-table* (make-hash-table))

(defun get-stream-closure (key)
  (gethash key *stream-closure-table*))

(defun allocate-stream-closure (&key reader writer)
  (let ((closure (make-stream-closure :read-func reader
                                      :write-func writer))
        (key (incf *stream-closure-key*)))
    (setf (gethash key *stream-closure-table*) closure)
    key))

(defun remove-stream-closure-and-raise-if-error (key)
  (let ((closure (get-stream-closure key)))
    (when closure
      (remhash key *stream-closure-table*)
      (when (stream-closure-error closure)
        (error (stream-closure-error closure))))))

(defmacro with-stream-closure ((var &key reader writer) &body body)
  `(let ((,var (allocate-stream-closure :reader ,reader
                                        :writer ,writer)))
     (unwind-protect
         (progn ,@body)
       (remove-stream-closure-and-raise-if-error ,var))))
(setf (get 'with-stream-closure 'ed:lisp-indent-hook) 'with-open-file)


(provide "cairo/api/support/stream-closure")

;;;; End
