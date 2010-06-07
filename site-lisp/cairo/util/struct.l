;;;; -*- mode: lisp; package: cairo.util -*-
;;;;
;;;; File: cairo/util/struct.l
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
  (require "cairo/util/sequence")
  (require "cairo/util/symbol")
  )

(in-package :cairo.util)

(export '(make-structure
          structure-description
          structure-name
          structure-constructor
          structure-constructors
          structure-slot-names
          structure-accessors
          export-structure
          export-condition
          ))

(defun make-structure (structure &rest rest)
  (apply (structure-constructor structure) rest))

(defun structure-definition (structure)
  (let ((def (cond ((si:*structure-definition-p structure)
                    structure)
                   ((si:*structurep structure)
                    (si:*structure-definition structure))
                   ((symbolp structure)
                    (get structure 'si::structure-definition)))))
    (unless def
      (error 'type-error
             :datum structure
             :expected-type 'structure))
    def))

(defun structure-name (structure)
  (si:*structure-definition-name
   (structure-definition structure)))

(defun structure-constructor (structure)
  (car (structure-constructors structure)))

(defun structure-constructors (structure)
  (si:*structure-definition-constructors
   (structure-definition structure)))

(defun structure-slot-descriptions (structure)
  (let ((def (structure-definition structure)))
    (mapcar #'(lambda (i)
                (multiple-value-list (si:*structure-definition-slot-description def i)))
            (generate-range 0 (si:*structure-definition-nslots def)))))

(defun structure-slot-names (structure)
  (mapcar #'car (structure-slot-descriptions structure)))

(defun structure-accessors (structure)
  (let* ((def (structure-definition structure))
         (name (structure-name def)))
    (mapcar #'(lambda (slot)
                (symbol-join name "-" slot))
            (structure-slot-names def))))


(defun export-structure (condition)
  (export-structure0 condition '(:accessors :constructors)))

(defun export-condition (condition)
  (export-structure0 condition '(:name :accessors)))

(defun export-structure0 (structure tags)
  (let ((desc (structure-description structure)))
    (dolist (tag tags)
      (let ((syms (cdr (assoc tag desc))))
        (when syms
          (export syms))))))

(defun structure-description (structure)
  (let ((def (structure-definition structure)))
    (list
     (cons :name (structure-name structure))
     (cons :constructors (structure-constructors structure))
     (cons :accessors (structure-accessors def)))))


(provide "cairo/util/struct")

;;;; End
