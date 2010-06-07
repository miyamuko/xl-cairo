;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/surfaces/png-functions.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/package")
  (require "cairo/ffi/macros")
  (require "cairo/ffi/base")
  (require "cairo/ffi/types")
  (require "cairo/ffi/support/types")
  )


(in-package :cairo.ffi)

;; http://www.cairographics.org/manual/cairo-png-functions.html#cairo-image-surface-create-from-png
(define-cairo-api
  surface-t*
  %cairo-image-surface-create-from-png ((c:char* filename)))

;; http://www.cairographics.org/manual/cairo-png-functions.html#cairo-read-func-t
(define-callback-function
  status-t
  read-func-t ((c:void* closure)
               (u_char* data)
               (c:u_int length)))

;; http://www.cairographics.org/manual/cairo-png-functions.html#cairo-image-surface-create-from-png-stream
(define-cairo-api
  surface-t*
  %cairo-image-surface-create-from-png-stream ((read-func-t read-func)
                                               (c:void* closure)))

;; http://www.cairographics.org/manual/cairo-png-functions.html#cairo-surface-write-to-png
(define-cairo-api
  status-t
  %cairo-surface-write-to-png ((surface-t* surface)
                               (c:char* filename)))

;; http://www.cairographics.org/manual/cairo-png-functions.html#cairo-surface-write-to-png-stream
(define-cairo-api
  status-t
  %cairo-surface-write-to-png-stream ((surface-t* surface)
                                      (write-func-t write-func)
                                      (c:void* closure)))



(provide "cairo/ffi/surfaces/png-functions")

;;;; End
