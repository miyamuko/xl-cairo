;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/surfaces/png-functions.l
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
  (require "cairo/util/symbol")
  (require "cairo/ffi/surfaces/png-functions")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  (require "cairo/api/support/stream-closure")
  )


(in-package :cairo)

(export '(cairo-image-surface-create-from-png
          cairo-surface-write-to-png

          call-with-output-to-png
          with-output-to-png
          ))


(defun cairo-image-surface-create-from-png (filename-or-stream)
  (if (streamp filename-or-stream)
      (cairo-image-surface-create-from-png-stream filename-or-stream)
    (cairo-image-surface-create-from-png0 filename-or-stream)))

(defun cairo-image-surface-create-from-png0 (filename)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-c-arguments ((c:char* filename))
        (%cairo-image-surface-create-from-png filename)))))


(defun cairo-surface-write-to-png (surface filename-or-stream)
  (if (streamp filename-or-stream)
      (cairo-surface-write-to-png-stream surface filename-or-stream)
    (cairo-surface-write-to-png0 surface filename-or-stream)))

(defun cairo-surface-write-to-png0 (surface filename)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:surface-t* surface)
                       (c:char* filename))
      (%cairo-surface-write-to-png surface filename))))



;;;; handmade section

(defun call-with-output-to-png (func surface filename)
  (funcall func surface filename)
  (cairo-surface-write-to-png surface filename))

(defmacro with-output-to-png ((surface filename) &body body)
  (with-gensyms (gsurface gfilename)
    `(let ((,gsurface ,surface)
           (,gfilename ,filename))
       (call-with-output-to-png (lambda (,gsurface ,gfilename) ,@body)
                                ,gsurface ,gfilename))))
(setf (get 'with-output-to-png 'ed:lisp-indent-hook) 'with-output-to-string)


;;; stream API (read)

(defun cairo-image-surface-create-from-png-stream (stream)
  #+xyzzy
  (ed:set-stream-encoding stream :binary)
  (cairo-image-surface-create-from-png-closure
   #'(lambda (vec length)
       #+xyzzy
       (ed:read-into vec stream t nil length)
       #-xyzzy
       (while (< (fill-pointer vec) length)
         (setf (aref vec (fill-pointer vec))
               (read-char-no-hang stream t nil))
         (incf (fill-pointer vec)))
       t)))

(defun cairo-image-surface-create-from-png-closure (closure)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-stream-closure (key :reader closure)
        (%cairo-image-surface-create-from-png-stream #'cairo.ffi::read-func-t
                                                     key)))))

(defun cairo.ffi::read-func-t-impl (key store-ptr length)
  (let ((closure (get-stream-closure key)))
    (when (or (not closure) (not (stream-closure-read-func closure)))
      (setf (stream-closure-error closure)
            (make-condition 'cairo-internal-error
                            :message (format nil "[bug] invalid read-func ~S" closure)))
      (return-from cairo.ffi::read-func-t-impl CAIRO_STATUS_READ_ERROR))
    (handler-case
        (let ((vec (make-vector length :element-type 'character :fill-pointer 0)))
          (if (funcall (stream-closure-read-func closure) vec length)
              (progn
                (store-c-string store-ptr vec length)
                CAIRO_STATUS_SUCCESS)
            CAIRO_STATUS_READ_ERROR))
      (error (c)
        (setf (stream-closure-error closure) c)
        CAIRO_STATUS_READ_ERROR)
      (quit (c)
        (setf (stream-closure-error closure) c)
        CAIRO_STATUS_READ_ERROR))))


;;; stream API (write)

(defun cairo-surface-write-to-png-stream (surface stream)
  #+xyzzy
  (ed:set-stream-encoding stream :binary)
  (cairo-surface-write-to-png-closure surface
                                      #'(lambda (data)
                                          (format stream "~A" data)
                                          t)))

(defun cairo-surface-write-to-png-closure (surface closure)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:surface-t* surface))
      (with-stream-closure (key :writer closure)
        (%cairo-surface-write-to-png-stream surface
                                            #'cairo.ffi::write-func-t
                                            key)))))

(defun cairo.ffi::write-func-t-impl (key data-ptr length)
  (let ((closure (get-stream-closure key)))
    (when (or (not closure) (not (stream-closure-write-func closure)))
      (setf (stream-closure-error closure)
            (make-condition 'cairo-internal-error
                            :message (format nil "[bug] invalid write-func ~S" closure)))
      (return-from cairo.ffi::write-func-t-impl CAIRO_STATUS_WRITE_ERROR))
    (handler-case
        (let ((data (unpack-c-string data-ptr :size length :zero-terminating-p nil)))
          (if (funcall (stream-closure-write-func closure) data)
              CAIRO_STATUS_SUCCESS
            CAIRO_STATUS_WRITE_ERROR))
      (error (c)
        (setf (stream-closure-error closure) c)
        CAIRO_STATUS_WRITE_ERROR)
      (quit (c)
        (setf (stream-closure-error closure) c)
        CAIRO_STATUS_WRITE_ERROR))))


(provide "cairo/api/surfaces/png-functions")

;;;; End
