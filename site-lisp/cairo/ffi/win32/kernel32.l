;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/win32/kernel32.l
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
  (require "cairo/ffi/macros")
  (require "cairo/ffi/base")
  (require "cairo/ffi/types")
  (require "cairo/ffi/support/types")
  )

(in-package :cairo.ffi)

(define-library define-kernel32-api
                "kernel32")

;; WinNls.h
(define-kernel32-api
  c:int
  MultiByteToWideChar ((UINT CodePage)         ; code page
                       (DWORD dwFlags)         ; character-type options
                       (LPCSTR lpMultiByteStr) ; string to map
                       (c:int cbMultiByte)     ; number of bytes in string
                       (LPWSTR lpWideCharStr)  ; wide-character buffer
                       (c:int cchWideChar)))   ; size of buffer

(define-kernel32-api
  DWORD
  GetLastError ())


(provide "cairo/ffi/win32/kernel32")

;;;; End
