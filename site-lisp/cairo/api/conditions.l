;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/conditions.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/util/symbol")
  (require "cairo/util/struct")
  (require "cairo/api/package")
  )

(in-package :cairo)

(defmacro define-cairo-base-error ((name base) msg &rest slots)
  `(define-condition ,name (,base)
     (message ,@slots)))
(setf (get 'define-cairo-base-error 'ed:lisp-indent-hook) 'define-condition)

(defmacro define-cairo-error ((name base) msg &rest slots)
  (let ((fraise (symbol-join "raise-" name))
        (fmessage (symbol-join name "-message")))
    `(progn
       (define-condition ,name (,base)
         (,@slots)
         (:report (lambda (c s)
                    (let ((extra (,fmessage c)))
                      (format s ,(format nil "cairo: ~A~~A" msg)
                              (if extra
                                  (format nil ": ~A" extra)
                                ""))))))

       (defun ,fraise (&optional message &rest args)
         (error (make-condition ',name
                                :message (and message (apply #'format nil message args)))))
       (export '(,fraise))

       (export-condition ',name))))
(setf (get 'define-cairo-error 'ed:lisp-indent-hook) 'define-condition)


;;;; base error

(define-cairo-base-error (cairo-error simple-package-error)
  "error")

(define-cairo-base-error (cairo-invalid-argument-error simple-program-error)
  "invalid argument")

(define-cairo-base-error (cairo-invalid-status-error simple-program-error)
  "invalid status")

(define-cairo-base-error (cairo-type-error type-error)
  "type error")

(define-cairo-base-error (cairo-file-error file-error)
  "IO error")


;;;; concrete error

(define-cairo-error (cairo-internal-error cairo-error)
  "internal error (bug!)")

(define-cairo-error (cairo-runtime-error cairo-error)
  "runtime error")

(define-cairo-error (cairo-argument-error cairo-runtime-error)
  "argument error")


(define-cairo-error (cairo-invalid-restore-error
                     cairo-invalid-status-error)
  "cairo_restore without matching cairo_save")

(define-cairo-error (cairo-invalid-pop-group-error
                     cairo-invalid-status-error)
  "cairo_pop_group without matching cairo_push_group")

(define-cairo-error (cairo-no-current-point-error
                     cairo-invalid-status-error)
  "no current point defined")

(define-cairo-error (cairo-invalid-matrix-error
                     cairo-invalid-argument-error)
  "invalid matrix (not invertible)")

(define-cairo-error (cairo-invalid-status-error
                     cairo-invalid-argument-error)
  "invalid value for an input cairo_status_t")

(define-cairo-error (cairo-null-pointer-error
                     cairo-invalid-argument-error)
  "NULL pointer")

(define-cairo-error (cairo-invalid-string-error
                     cairo-invalid-argument-error)
  "input string not valid UTF-8")

(define-cairo-error (cairo-invalid-path-data-error
                     cairo-invalid-argument-error)
  "input path data not valid")

(define-cairo-error (cairo-read-error
                     cairo-file-error)
  "error while reading from input stream")

(define-cairo-error (cairo-write-error
                     cairo-file-error)
  "error while writing to output stream")

(define-cairo-error (cairo-surface-finished-error
                     cairo-invalid-status-error)
  "the target surface has been finished")

(define-cairo-error (cairo-surface-type-mismatch-error
                     cairo-type-error)
  "the surface type is not appropriate for the operation")

(define-cairo-error (cairo-pattern-type-mismatch-error
                     cairo-type-error)
  "the pattern type is not appropriate for the operation")

(define-cairo-error (cairo-invalid-content-error
                     cairo-invalid-argument-error)
  "invalid value for an input cairo_content_t")

(define-cairo-error (cairo-invalid-format-error
                     cairo-invalid-argument-error)
  "invalid value for an input cairo_format_t")

(define-cairo-error (cairo-invalid-visual-error
                     cairo-invalid-argument-error)
  "invalid value for an input Visual*")

(define-cairo-error (cairo-file-not-found-error
                     cairo-file-error)
  "file not found")

(define-cairo-error (cairo-invalid-dash-error
                     cairo-invalid-argument-error)
  "invalid value for a dash setting")

(define-cairo-error (cairo-invalid-dsc-comment-error
                     cairo-invalid-argument-error)
  "invalid value for a DSC comment")

(define-cairo-error (cairo-invalid-index-error
                     cairo-invalid-argument-error)
  "invalid index passed to getter")

(define-cairo-error (cairo-clip-not-representable-error
                     cairo-type-error)
  "clip region not representable in desired format")

(define-cairo-error (cairo-temp-file-error
                     cairo-file-error)
  "error creating or writing to a temporary file")

(define-cairo-error (cairo-invalid-stride
                     cairo-invalid-argument-error)
  "invalid value for stride")

(define-cairo-error (cairo-font-type-mismatch
                     cairo-type-error)
  "the font type is not appropriate for the operation")

(define-cairo-error (cairo-user-font-immutable
                     cairo-invalid-argument-error)
  "the user-font is immutable")

(define-cairo-error (cairo-user-font-error
                     cairo-runtime-error)
  "error occurred in a user-font callback function")

(define-cairo-error (cairo-negative-count
                     cairo-invalid-argument-error)
  "negative number used where it is not allowed")

(define-cairo-error (cairo-invalid-clusters
                     cairo-invalid-argument-error)
  "input clusters do not represent the accompanying text and glyph array")

(define-cairo-error (cairo-invalid-slant
                     cairo-invalid-argument-error)
  "invalid value for an input cairo_font_slant_t")

(define-cairo-error (cairo-invalid-weight
                     cairo-invalid-argument-error)
  "invalid value for an input cairo_font_weight_t")


;; error-status Ç™í«â¡Ç≥ÇÍÇΩÇÁÇ±Ç±Ç≈ó·äOÇíËã`ÇµÇƒ
;; api/support/error-status.l Ç≈ó·äOÇìäÇ∞ÇÈèàóùÇí«â¡
;; http://www.cairographics.org/manual/cairo-error-status.html#cairo-status-t

(provide "cairo/api/conditions")

;;;; End
