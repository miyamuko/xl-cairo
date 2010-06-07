;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/dll.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/util/path")
  (require "cairo/util/sequence")
  (require "cairo/ffi/package")
  )

(in-package :cairo.ffi)

(export '(cairo-reload-dll
          cairo-unload-dll
          ))

(defparameter *cairo-dll-name* "libcairo-2.dll")
(defparameter *cairo-dll-dependencies* '("zlib1.dll" "libpng12.dll"))

(defparameter *lib-directory* (relative-path-from
                               (si:system-root)
                               (merge-pathnames "../lib" (directory-namestring *load-pathname*))))

(defun cairo-dll-path-for (filename)
  (merge-pathnames filename (merge-pathnames *lib-directory* (si:system-root))))

(defun cairo-dll ()
  (cairo-load-dependencies)
  (cairo-dll-path-for *cairo-dll-name*))

(defun cairo-load-dependencies ()
  (dolist (dll *cairo-dll-dependencies*)
    (si:load-dll-module (cairo-dll-path-for dll))))

(defconstant cairo-dll-entry-modules
  '("cairo/ffi/support"
    "cairo/ffi/drawing"
    "cairo/ffi/fonts"
    "cairo/ffi/surfaces"))

(defun cairo-reload-dll ()
  (cairo-unload-dll)
  (dolist (e cairo-dll-entry-modules)
    (require e)))

(defun cairo-unload-dll ()
  (do-external-symbols (sym 'cairo.ffi)
    (when (eq (get sym 'foreign-type) 'dll-entry-point) ;; foreign-type => macros.l
      (fmakunbound sym)))
  (gc) ; call FreeLibrary
  (setf *modules* (remove-if #'(lambda (module)
                                 (some #'(lambda (e)
                                           (start-with e module))
                                       cairo-dll-entry-modules))
                             *modules*)))


(provide "cairo/ffi/dll")

;;;; End
