;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/types/win32.l
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
  (require "cairo/ffi/types/base")
  )

(in-package :cairo.ffi)


;;;; WinBase.h

(*define-c-type (WCHAR *) LPWSTR)


;;;; WinGDI.h

;; The lfHeight, lfWidth, lfOrientation and lfEscapement fields of this structure are ignored.
(define-c-struct-with-ptr LOGFONTW
  (LONG lfHeight)               ; ignore
  (LONG lfWidth)                ; ignore
  (LONG lfEscapement)           ; ignore
  (LONG lfOrientation)          ; ignore
  (LONG lfWeight)
  (BYTE lfItalic)
  (BYTE lfUnderline)
  (BYTE lfStrikeOut)
  (BYTE lfCharSet)
  (BYTE lfOutPrecision)
  (BYTE lfClipPrecision)
  (BYTE lfQuality)
  (BYTE lfPitchAndFamily)
  (WCHAR lfFaceName LF_FACESIZE))



(*define OUT_DEFAULT_PRECIS          0)
(*define OUT_STRING_PRECIS           1)
(*define OUT_CHARACTER_PRECIS        2)
(*define OUT_STROKE_PRECIS           3)
(*define OUT_TT_PRECIS               4)
(*define OUT_DEVICE_PRECIS           5)
(*define OUT_RASTER_PRECIS           6)
(*define OUT_TT_ONLY_PRECIS          7)
(*define OUT_OUTLINE_PRECIS          8)
(*define OUT_SCREEN_OUTLINE_PRECIS   9)
(*define OUT_PS_ONLY_PRECIS          10)

(*define CLIP_DEFAULT_PRECIS     0)
(*define CLIP_CHARACTER_PRECIS   1)
(*define CLIP_STROKE_PRECIS      2)
(*define CLIP_MASK               #xf)
(*define CLIP_LH_ANGLES          (ash 1 4))
(*define CLIP_TT_ALWAYS          (ash 2 4))
(*define CLIP_DFA_DISABLE        (ash 4 4))
(*define CLIP_EMBEDDED           (ash 8 4))

(*define DEFAULT_QUALITY          0)
(*define DRAFT_QUALITY            1)
(*define PROOF_QUALITY            2)

(*define NONANTIALIASED_QUALITY   3)
(*define ANTIALIASED_QUALITY      4)



(*define CLEARTYPE_QUALITY        5)



(*define CLEARTYPE_NATURAL_QUALITY 6)


(*define DEFAULT_PITCH           0)
(*define FIXED_PITCH             1)
(*define VARIABLE_PITCH          2)

(*define MONO_FONT               8)


(*define ANSI_CHARSET            0)
(*define DEFAULT_CHARSET         1)
(*define SYMBOL_CHARSET          2)
(*define SHIFTJIS_CHARSET        128)
(*define HANGEUL_CHARSET         129)
(*define HANGUL_CHARSET          129)
(*define GB2312_CHARSET          134)
(*define CHINESEBIG5_CHARSET     136)
(*define OEM_CHARSET             255)

(*define JOHAB_CHARSET           130)
(*define HEBREW_CHARSET          177)
(*define ARABIC_CHARSET          178)
(*define GREEK_CHARSET           161)
(*define TURKISH_CHARSET         162)
(*define VIETNAMESE_CHARSET      163)
(*define THAI_CHARSET            222)
(*define EASTEUROPE_CHARSET      238)
(*define RUSSIAN_CHARSET         204)

(*define MAC_CHARSET             77)
(*define BALTIC_CHARSET          186)

(*define FS_LATIN1               #x00000001)
(*define FS_LATIN2               #x00000002)
(*define FS_CYRILLIC             #x00000004)
(*define FS_GREEK                #x00000008)
(*define FS_TURKISH              #x00000010)
(*define FS_HEBREW               #x00000020)
(*define FS_ARABIC               #x00000040)
(*define FS_BALTIC               #x00000080)
(*define FS_VIETNAMESE           #x00000100)
(*define FS_THAI                 #x00010000)
(*define FS_JISJAPAN             #x00020000)
(*define FS_CHINESESIMP          #x00040000)
(*define FS_WANSUNG              #x00080000)
(*define FS_CHINESETRAD          #x00100000)
(*define FS_JOHAB                #x00200000)
(*define FS_SYMBOL               #x80000000)


; Font Families
(*define FF_DONTCARE         (ash 0 4))  ; Don't care or don't know.
(*define FF_ROMAN            (ash 1 4))  ; Variable stroke width, serifed.
                                    ; Times Roman, Century Schoolbook, etc.
(*define FF_SWISS            (ash 2 4))  ; Variable stroke width, sans-serifed.
                                    ; Helvetica, Swiss, etc.
(*define FF_MODERN           (ash 3 4))  ; Constant stroke width, serifed or sans-serifed.
                                    ; Pica, Elite, Courier, etc.
(*define FF_SCRIPT           (ash 4 4))  ; Cursive, etc.
(*define FF_DECORATIVE       (ash 5 4))  ; Old English, etc.

; Font Weights
(*define FW_DONTCARE         0)
(*define FW_THIN             100)
(*define FW_EXTRALIGHT       200)
(*define FW_LIGHT            300)
(*define FW_NORMAL           400)
(*define FW_MEDIUM           500)
(*define FW_SEMIBOLD         600)
(*define FW_BOLD             700)
(*define FW_EXTRABOLD        800)
(*define FW_HEAVY            900)

(*define FW_ULTRALIGHT       FW_EXTRALIGHT)
(*define FW_REGULAR          FW_NORMAL)
(*define FW_DEMIBOLD         FW_SEMIBOLD)
(*define FW_ULTRABOLD        FW_EXTRABOLD)
(*define FW_BLACK            FW_HEAVY)



;;;; WinNls.h

;;
;;  MBCS and Unicode Translation Flags.
;;

(*define MB_PRECOMPOSED            #x00000001)  ; use precomposed chars
(*define MB_COMPOSITE              #x00000002)  ; use composite chars
(*define MB_USEGLYPHCHARS          #x00000004)  ; use glyph chars, not ctrl chars
(*define MB_ERR_INVALID_CHARS      #x00000008)  ; error for invalid chars

(*define WC_COMPOSITECHECK         #x00000200)  ; convert composite to precomposed
(*define WC_DISCARDNS              #x00000010)  ; discard non-spacing chars
(*define WC_SEPCHARS               #x00000020)  ; generate separate chars
(*define WC_DEFAULTCHAR            #x00000040)  ; replace w/ default char

(*define WC_NO_BEST_FIT_CHARS      #x00000400)  ; do not use best fit chars

;;
;;  Code Page Default Values.
;;
(*define CP_ACP                    0)           ; default to ANSI code page
(*define CP_OEMCP                  1)           ; default to OEM  code page
(*define CP_MACCP                  2)           ; default to MAC  code page
(*define CP_THREAD_ACP             3)           ; current thread's ANSI code page
(*define CP_SYMBOL                 42)          ; SYMBOL translations

(*define CP_UTF7                   65000)       ; UTF-7 translation
(*define CP_UTF8                   65001)       ; UTF-8 translation


;;;; WinError.h

;; for MultiByteToWideChar
(*define ERROR_INVALID_PARAMETER          87)
(*define ERROR_INSUFFICIENT_BUFFER        122)
(*define ERROR_INVALID_FLAGS              1004)
(*define ERROR_NO_UNICODE_TRANSLATION     1113)


(provide "cairo/ffi/types/win32")

;;;; End
