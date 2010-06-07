;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/types/base.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/util")
  (require "cairo/ffi/types")
  (require "cairo/api/package")
  (require "cairo/api/macros")
  )

(in-package :cairo)


(define-autoboxing-for (c:void)
  :lisp->c '(lambda (v) nil)
  :c->lisp '(lambda (v) nil))

(define-autoboxing-for (c:int
                        c:u_int
                        c:u_long
                        winapi::HDC
                        winapi::HFONT
                        cairo.ffi:u_char*
                        cairo.ffi:LOGFONTW*)
  :lisp->c 'no-need-to-autoboxing
  :c->lisp 'no-need-to-autoboxing)

(define-autoboxing-for (c:double)
  :lisp->c 'no-need-to-autoboxing                   ;; 勝手に double-float になるのでなにもしない
  :c->lisp '(lambda (v) (coerce v 'single-float)))  ;; double-float はうざいので single-float にする


(defun pack-array-of-double (doubles)
  (pack-c-array 'c:double (mapcar #'make-double-chunk doubles)))

(defun unpack-array-of-double (chunk n)
  (mapcar (c->lisp-converter 'c:double)
          (unpack-c-array 'c:double
                          (si:chunk-data chunk)
                          n)))

(define-autoboxing-for (cairo::array-of-double)
  :lisp->c 'pack-array-of-double
  ;; c->lisp の変換をするにはポインタと要素数が必要なので
  ;; auto-boxing のフレームワークでは対応できない
  )


(define-autoboxing-for (c:char*)
  :lisp->c 'si:make-string-chunk
  :c->lisp 'unpack-c-string)

(define-autoboxing-for (cairo.ffi:bool-t)
  :c->lisp '(lambda (v) (not (zerop v)))
  :lisp->c '(lambda (v) (if v 1 0)))


;;;; autoboxing for encoded char*.

(defmacro define-autoboxing-for-char*-with-encoding (type encoding)
  `(progn
     (c:define-c-type c:char* ,type)
     (define-autoboxing-for (,type)
       :lisp->c '(lambda (v)
                  (si:make-string-chunk (if v
                                            (ed:convert-encoding-from-internal ,encoding v)
                                          "")))
       :c->lisp '(lambda (v)
                  (if v
                      (ed:convert-encoding-to-internal ,encoding (unpack-c-string v))
                    "")))))

(define-autoboxing-for-char*-with-encoding cairo::utf8-char*
                                           ed:*encoding-utf8n*)
(define-autoboxing-for-char*-with-encoding cairo::utf16le-char*
                                           ed:*encoding-utf16le*)


(provide "cairo/api/types/base")

;;;; End
