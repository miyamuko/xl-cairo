;;;; -*- mode: lisp; package: cairo.util -*-
;;;;
;;;; File: cairo/util/path.l
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
  )

(in-package :cairo.util)

(export '(relative-path-from
          ))

(defun path-join (path)
  (format nil "~{~A~^/~}" path))

(defun split-local-path (path &key include-file)
  (pathname-directory (if (or (equal "" (file-namestring path))
                              include-file)
                          (merge-pathnames "dummy" path)
                        path)))

(defun relative-path-from (from path)
  (labels ((make-relative-path-elems (from path)
             (append (make-list (length from) :initial-element "..")
                     path))
           (rec (from path)
             (if (and (car from) (car path)
                      (equalp (car from) (car path)))
                 (rec (cdr from) (cdr path))
               (path-join (make-relative-path-elems from path)))))
    (rec (split-local-path from :include-file nil)
         (split-local-path path :include-file t))))


(provide "cairo/util/path")

;;;; End
