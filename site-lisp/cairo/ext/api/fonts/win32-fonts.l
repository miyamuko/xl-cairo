;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/api/fonts/win32-fonts.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api")
  (require "cairo/ext/package")
  )


(in-package :cairo.ext)

(export '(cairo-win32-font-face-create
          ))

(defun cairo-win32-font-face-create (facename &key
                                              (bold nil)
                                              (italic nil)
                                              (underline nil)
                                              (strike-out nil))
  (cairo-win32-font-face-create-for-logfontw
   (create-logfontw facename
                    :weight (if bold FW_BOLD FW_NORMAL)
                    :italic italic
                    :underline underline
                    :strike-out strike-out)))

(defun create-logfontw (facename &key
                                 (weight FW_DONTCARE)
                                 (italic nil)
                                 (underline nil)
                                 (strike-out nil)
                                 (charset DEFAULT_CHARSET)
                                 (out-precision OUT_DEFAULT_PRECIS)
                                 (clip-precision CLIP_DEFAULT_PRECIS)
                                 (quality DEFAULT_QUALITY)
                                 (pitch-and-family (logior DEFAULT_PITCH FF_DONTCARE)))
  (flet ((to-bool (flag)
           (if flag 1 0)))
    (let ((lf (make-LOGFONTW)))
      (setf (LOGFONTW-lfHeight lf)         0
            (LOGFONTW-lfWidth lf)          0
            (LOGFONTW-lfEscapement lf)     0
            (LOGFONTW-lfOrientation lf)    0
            (LOGFONTW-lfWeight lf)         weight
            (LOGFONTW-lfItalic lf)         (to-bool italic)
            (LOGFONTW-lfUnderline lf)      (to-bool underline)
            (LOGFONTW-lfStrikeOut lf)      (to-bool strike-out)
            (LOGFONTW-lfCharSet lf)        charset
            (LOGFONTW-lfOutPrecision lf)   out-precision
            (LOGFONTW-lfClipPrecision lf)  clip-precision
            (LOGFONTW-lfQuality lf)        quality
            (LOGFONTW-lfPitchAndFamily lf) pitch-and-family)
      (let* ((cstr (si:make-string-chunk (or facename "")))
             (r (MultiByteToWideChar 932
                                     0
                                     cstr
                                     (si:chunk-size cstr)
                                     (+ (si:chunk-data lf)
                                        (c:c-struct-offset-of cairo.ffi::LOGFONTW cairo.ffi::lfFaceName))
                                     winapi::LF_FACESIZE)))
        (when (zerop r)
          (let ((lasterror (GetLastError)))
            (cond ((= lasterror ERROR_INSUFFICIENT_BUFFER)
                   (raise-cairo-argument-error "ƒtƒHƒ“ƒg–¼‚ª’·‚·‚¬‚Ü‚·: ~S" facename))
                  (t
                   (raise-cairo-internal-error "MultiByteToWideChar error (~S)" lasterror))))))
      lf)))


(provide "cairo/ext/api/fonts/win32-fonts")

;;;; End
