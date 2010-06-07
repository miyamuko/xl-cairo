;;;; -*- mode: lisp; package: cairo.util -*-
;;;;
;;;; File: cairo/util/c-struct.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/util/package")
  (require "foreign")
  )

(in-package :cairo.util)


(export '(c-struct-type-definition
          c-struct-name
          c-struct-slot-names
          c-struct-accessors))

(defun c-struct-type-definition (c-struct)
  (let ((def (cond ((c::c-type-definition-p c-struct)
                    c-struct)
                   ((eq (type-of c-struct) 'si:chunk)
                    (c::expand-c-type (si:chunk-type c-struct)))
                   ((symbolp c-struct)
                    (c::expand-c-type c-struct)))))
    (unless def
      (error 'type-error
             :datum c-struct
             :expected-type 'c-struct))
    def))

(defun c-struct-name (c-struct)
  (let ((typedef (c-struct-type-definition c-struct)))
    (c::ctypedef-type typedef)))

(defun c-struct-slot-descriptions (c-struct)
  (let ((typedef (c-struct-type-definition c-struct)))
    (mapcar #'(lambda (slot)
                (list (c::cslot-name slot)
                      (c::ctypedef-type (c::cslot-type slot))
                      (c::cslot-offset slot)
                      (c::cslot-size slot)))
            (c::ctypedef-slots typedef))))

(defun c-struct-slot-names (c-struct)
  (mapcar #'car (c-struct-slot-descriptions c-struct)))

(defun c-struct-accessors (c-struct)
  (let* ((def (c-struct-type-definition c-struct))
         (name (c-struct-name def)))
    (mapcar #'(lambda (slot)
                (symbol-join name "-" slot))
            (c-struct-slot-names def))))


(provide "cairo/util/c-struct")

;;;; End
