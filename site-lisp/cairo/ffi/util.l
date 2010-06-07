;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/util.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/package")
  (require "cairo/util/sequence")
  )

(in-package :cairo.ffi)

(export '(nullp
          sizeof
          number-of
          chunkp
          make-chunk-for
          unpack-chunk-for
          unpack-pointer
          unpack-c-string
          store-c-string
          make-array-chunk-for
          pack-c-array
          unpack-c-array
          ))

(defun nullp (p)
  (or (null p)
      (and (numberp p) (zerop p))))

(defun sizeof (type)
  (c::ctypedef-size (c::expand-c-type type)))

(defun number-of (array-chunk type)
  (/ (si:chunk-size array-chunk) (sizeof type)))

(defun chunkp (v)
  (eq (type-of v) 'si:chunk))

(defun make-chunk-for (type &optional (init-value 0))
  (let ((r (si:make-chunk type (sizeof type))))
    (funcall (get (c::ctypedef-accessor (c::expand-c-type type)) 'lisp::setf-update)
             r 0 init-value)
    r))

(defun unpack-chunk-for (type chunk)
  (funcall (c::ctypedef-accessor (c::expand-c-type type)) chunk 0))

(defun unpack-c-string (ptr &key (size 255) (zero-terminating-p t))
  (unless (nullp ptr)
    (si:unpack-string (si:make-chunk nil size nil ptr)
                      0 size zero-terminating-p)))

(defun store-c-string (to-ptr from size)
  (si:copy-chunk (si:make-string-chunk from)
                 (si:make-chunk nil size nil to-ptr)
                 size))

(defun make-array-chunk-for (type n)
  (si:make-chunk type (* (sizeof type) n)))

(defun pack-c-array (type list-of-chunk)
  (let ((size (sizeof type))
        (n (length list-of-chunk)))
    (reduce #'(lambda (ary index/chunk)
                (si:copy-chunk (cdr index/chunk) ary size
                               0 (* size (car index/chunk)))
                ary)
            (mapcar #'cons (generate-range 0 n) list-of-chunk)
            :initial-value (si:make-chunk type (* size n)))))

(defun unpack-c-array (type ptr-or-chunk count)
  (let ((ptr (if (chunkp ptr-or-chunk)
                 (si:chunk-data ptr-or-chunk)
               ptr-or-chunk)))
    (mapcar #'(lambda (i)
                (unpack-c-array-element type ptr i))
            (generate-range 0 count))))

(defun unpack-c-array-element (type ptr index)
  (let ((size (sizeof type)))
    (unpack-chunk-for type (si:make-chunk type size
                                          nil (+ ptr (* index size))))))


(provide "cairo/ffi/util")

;;;; End
