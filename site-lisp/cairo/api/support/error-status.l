;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/support/error-status.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/support/error-status")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/conditions")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  (require "cairo/api/support/version-info")
  )


(in-package :cairo)

(export '(cairo-status-to-string
          cairo-debug-reset-static-data
          ))


(defun cairo-status-to-string (status)
  (returning (c:char*)
    (if (integerp status)
        (%cairo-status-to-string status)
      (with-c-arguments ((cairo.ffi:status-t status))
        (%cairo-status-to-string status)))))

(defun cairo-debug-reset-static-data ()
  (returning (c:void)
    (%cairo-debug-reset-static-data)))


;;;; handmade section

(defun raise-error-if-cairo-status-is-not-success (v &optional msg)
  (let ((n (status-t-enum-name v)))
    (unless (eq n :success)
      (case n
        (:no-memory
         (error (make-condition 'stack-overflow)))
        (:invalid-restore
         (raise-cairo-invalid-restore-error msg))
        (:invalid-pop-group
         (raise-cairo-invalid-pop-group-error msg))
        (:no-current-point
         (raise-cairo-no-current-point-error msg))
        (:invalid-matrix
         (raise-cairo-invalid-matrix-error msg))
        (:invalid-status
         (raise-cairo-invalid-status-error msg))
        (:null-pointer
         (raise-cairo-null-pointer-error msg))
        (:invalid-string
         (raise-cairo-invalid-string-error msg))
        (:invalid-path-data
         (raise-cairo-invalid-path-data-error msg))
        (:read-error
         (raise-cairo-read-error msg))
        (:write-error
         (raise-cairo-write-error msg))
        (:surface-finished
         (raise-cairo-surface-finished-error msg))
        (:surface-type-mismatch
         (raise-cairo-surface-type-mismatch-error msg))
        (:pattern-type-mismatch
         (raise-cairo-pattern-type-mismatch-error msg))
        (:invalid-content
         (raise-cairo-invalid-content-error msg))
        (:invalid-format
         (raise-cairo-invalid-format-error msg))
        (:invalid-visual
         (raise-cairo-invalid-visual-error msg))
        (:file-not-found
         (raise-cairo-file-not-found-error msg))
        (:invalid-dash
         (raise-cairo-invalid-dash-error msg))
        (:invalid-dsc-comment
         (raise-cairo-invalid-dsc-comment-error msg))
        (:invalid-index
         (raise-cairo-invalid-index-error msg))
        (:clip-not-representable
         (raise-cairo-clip-not-representable-error msg))
        (:temp-file-error
         (raise-cairo-temp-file-error msg))
        (:invalid-stride
         (raise-cairo-invalid-stride msg))
        (:font-type-mismatch
         (raise-cairo-font-type-mismatch msg))
        (:user-font-immutable
         (raise-cairo-user-font-immutable msg))
        (:user-font-error
         (raise-cairo-user-font-error msg))
        (:negative-count
         (raise-cairo-negative-count msg))
        (:invalid-clusters
         (raise-cairo-invalid-clusters msg))
        (:invalid-slant
         (raise-cairo-invalid-slant msg))
        (:invalid-weight
         (raise-cairo-invalid-weight msg))
        (t
         (raise-cairo-runtime-error "unknown error!: ~A (error code: ~S, cairo version ~A)"
                                    (cairo-status-to-string v)
                                    v
                                    (cairo-version-string)))))))

;; returning マクロで抜けるときに status-t の場合
;; 自動的に値をチェックしてエラーなら例外を投げる
(setf (get 'cairo.ffi:status-t 'cairo::returning-hook)
      'raise-error-if-cairo-status-is-not-success)


(provide "cairo/api/support/error-status")

;;;; End
