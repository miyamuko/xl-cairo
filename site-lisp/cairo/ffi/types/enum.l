;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/types/enum.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: full
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/package")
  (require "cairo/ffi/macros")
  (require "cairo/ffi/types/base")
  )


(in-package :cairo.ffi)

;;;; cairo-drawing - cairo_t

;; http://www.cairographics.org/manual/cairo-context.html#cairo-antialias-t
(define-c-enum-with-ptr antialias-t
  (CAIRO_ANTIALIAS_DEFAULT  :default)
  (CAIRO_ANTIALIAS_NONE     :none)
  (CAIRO_ANTIALIAS_GRAY     :gray)
  (CAIRO_ANTIALIAS_SUBPIXEL :subpixel))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-fill-rule-t
(define-c-enum-with-ptr fill-rule-t
  (CAIRO_FILL_RULE_WINDING  :winding)
  (CAIRO_FILL_RULE_EVEN_ODD :even-odd))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-line-cap-t
(define-c-enum-with-ptr line-cap-t
  (CAIRO_LINE_CAP_BUTT   :butt)
  (CAIRO_LINE_CAP_ROUND  :round)
  (CAIRO_LINE_CAP_SQUARE :square))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-line-join-t
(define-c-enum-with-ptr line-join-t
  (CAIRO_LINE_JOIN_MITER :miter)
  (CAIRO_LINE_JOIN_ROUND :round)
  (CAIRO_LINE_JOIN_BEVEL :bevel))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-operator-t
(define-c-enum-with-ptr operator-t
  (CAIRO_OPERATOR_CLEAR     :clear)
  (CAIRO_OPERATOR_SOURCE    :source)
  (CAIRO_OPERATOR_OVER      :over)
  (CAIRO_OPERATOR_IN        :in)
  (CAIRO_OPERATOR_OUT       :out)
  (CAIRO_OPERATOR_ATOP      :atop)
  (CAIRO_OPERATOR_DEST      :dest)
  (CAIRO_OPERATOR_DEST_OVER :dest-over)
  (CAIRO_OPERATOR_DEST_IN   :dest-in)
  (CAIRO_OPERATOR_DEST_OUT  :dest-out)
  (CAIRO_OPERATOR_DEST_ATOP :dest-atop)
  (CAIRO_OPERATOR_XOR       :xor)
  (CAIRO_OPERATOR_ADD       :add)
  (CAIRO_OPERATOR_SATURATE  :saturate))

;;;; cairo-drawing - Paths

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-path-data-type-t
(define-c-enum-with-ptr path-data-type-t
  (CAIRO_PATH_MOVE_TO    :move-to)
  (CAIRO_PATH_LINE_TO    :line-to)
  (CAIRO_PATH_CURVE_TO   :curve-to)
  (CAIRO_PATH_CLOSE_PATH :close-path))

;;;; cairo-drawing - cairo_pattern_t

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-extend-t
(define-c-enum-with-ptr extend-t
  (CAIRO_EXTEND_NONE    :none)
  (CAIRO_EXTEND_REPEAT  :repeat)
  (CAIRO_EXTEND_REFLECT :reflect)
  (CAIRO_EXTEND_PAD     :pad))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-filter-t
(define-c-enum-with-ptr filter-t
  (CAIRO_FILTER_FAST     :fast)
  (CAIRO_FILTER_GOOD     :good)
  (CAIRO_FILTER_BEST     :best)
  (CAIRO_FILTER_NEAREST  :nearest)
  (CAIRO_FILTER_BILINEAR :bilinear)
  (CAIRO_FILTER_GAUSSIAN :gaussian))

;; http://www.cairographics.org/manual/cairo-pattern.html#cairo-pattern-type-t
(define-c-enum-with-ptr pattern-type-t
  (CAIRO_PATTERN_TYPE_SOLID   :solid)
  (CAIRO_PATTERN_TYPE_SURFACE :surface)
  (CAIRO_PATTERN_TYPE_LINEAR  :linear)
  (CAIRO_PATTERN_TYPE_RADIAL  :radial))

;;;; cairo-drawing - Text

;; http://www.cairographics.org/manual/cairo-text.html#cairo-font-slant-t
(define-c-enum-with-ptr font-slant-t
  (CAIRO_FONT_SLANT_NORMAL  :normal)
  (CAIRO_FONT_SLANT_ITALIC  :italic)
  (CAIRO_FONT_SLANT_OBLIQUE :oblique))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-font-weight-t
(define-c-enum-with-ptr font-weight-t
  (CAIRO_FONT_WEIGHT_NORMAL :normal)
  (CAIRO_FONT_WEIGHT_BOLD   :bold))

;; http://www.cairographics.org/manual/cairo-text.html#cairo-text-cluster-flags-t
(define-c-enum-with-ptr text-cluster-flags-t
  (CAIRO_TEXT_CLUSTER_FLAG_BACKWARD :flag-backward #x00000001))

;;;; cairo-fonts - cairo_font_face_t

;; http://www.cairographics.org/manual/cairo-font-face.html#cairo-font-type-t
(define-c-enum-with-ptr font-type-t
  (CAIRO_FONT_TYPE_TOY    :toy)
  (CAIRO_FONT_TYPE_FT     :ft)
  (CAIRO_FONT_TYPE_WIN32  :win32)
  (CAIRO_FONT_TYPE_QUARTZ :quartz)
  (CAIRO_FONT_TYPE_USER   :user))

;;;; cairo-fonts - cairo_font_options_t

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-subpixel-order-t
(define-c-enum-with-ptr subpixel-order-t
  (CAIRO_SUBPIXEL_ORDER_DEFAULT :default)
  (CAIRO_SUBPIXEL_ORDER_RGB     :rgb)
  (CAIRO_SUBPIXEL_ORDER_BGR     :bgr)
  (CAIRO_SUBPIXEL_ORDER_VRGB    :vrgb)
  (CAIRO_SUBPIXEL_ORDER_VBGR    :vbgr))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-hint-style-t
(define-c-enum-with-ptr hint-style-t
  (CAIRO_HINT_STYLE_DEFAULT :default)
  (CAIRO_HINT_STYLE_NONE    :none)
  (CAIRO_HINT_STYLE_SLIGHT  :slight)
  (CAIRO_HINT_STYLE_MEDIUM  :medium)
  (CAIRO_HINT_STYLE_FULL    :full))

;; http://www.cairographics.org/manual/cairo-font-options.html#cairo-hint-metrics-t
(define-c-enum-with-ptr hint-metrics-t
  (CAIRO_HINT_METRICS_DEFAULT :default)
  (CAIRO_HINT_METRICS_OFF     :off)
  (CAIRO_HINT_METRICS_ON      :on))

;;;; cairo-surfaces - cairo_surface_t

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-content-t
(define-c-enum-with-ptr content-t
  (CAIRO_CONTENT_COLOR       :color       #x1000)
  (CAIRO_CONTENT_ALPHA       :alpha       #x2000)
  (CAIRO_CONTENT_COLOR_ALPHA :color-alpha #x3000))

;; http://www.cairographics.org/manual/cairo-surface.html#cairo-surface-type-t
(define-c-enum-with-ptr surface-type-t
  (CAIRO_SURFACE_TYPE_IMAGE          :image)
  (CAIRO_SURFACE_TYPE_PDF            :pdf)
  (CAIRO_SURFACE_TYPE_PS             :ps)
  (CAIRO_SURFACE_TYPE_XLIB           :xlib)
  (CAIRO_SURFACE_TYPE_XCB            :xcb)
  (CAIRO_SURFACE_TYPE_GLITZ          :glitz)
  (CAIRO_SURFACE_TYPE_QUARTZ         :quartz)
  (CAIRO_SURFACE_TYPE_WIN32          :win32)
  (CAIRO_SURFACE_TYPE_BEOS           :beos)
  (CAIRO_SURFACE_TYPE_DIRECTFB       :directfb)
  (CAIRO_SURFACE_TYPE_SVG            :svg)
  (CAIRO_SURFACE_TYPE_OS2            :os2)
  (CAIRO_SURFACE_TYPE_WIN32_PRINTING :win32-printing)
  (CAIRO_SURFACE_TYPE_QUARTZ_IMAGE   :quartz-image))

;;;; cairo-surfaces - Image Surfaces

;; http://www.cairographics.org/manual/cairo-image-surface.html#cairo-format-t
(define-c-enum-with-ptr format-t
  (CAIRO_FORMAT_ARGB32 :argb32)
  (CAIRO_FORMAT_RGB24  :rgb24)
  (CAIRO_FORMAT_A8     :a8)
  (CAIRO_FORMAT_A1     :a1))

;;;; cairo-surfaces - PostScript Surfaces

;; http://www.cairographics.org/manual/cairo-ps-surface.html#cairo-ps-level-t
(define-c-enum-with-ptr ps-level-t
  (CAIRO_PS_LEVEL_2 :2)
  (CAIRO_PS_LEVEL_3 :3))

;;;; cairo-surfaces - SVG Surfaces

;; http://www.cairographics.org/manual/cairo-svg-surface.html#cairo-svg-version-t
(define-c-enum-with-ptr svg-version-t
  (CAIRO_SVG_VERSION_1_1 :1-1)
  (CAIRO_SVG_VERSION_1_2 :1-2))

;;;; cairo-support - Error handling

;; http://www.cairographics.org/manual/cairo-error-status.html#cairo-status-t
(define-c-enum-with-ptr status-t
  (CAIRO_STATUS_SUCCESS                :success                0)
  (CAIRO_STATUS_NO_MEMORY              :no-memory)
  (CAIRO_STATUS_INVALID_RESTORE        :invalid-restore)
  (CAIRO_STATUS_INVALID_POP_GROUP      :invalid-pop-group)
  (CAIRO_STATUS_NO_CURRENT_POINT       :no-current-point)
  (CAIRO_STATUS_INVALID_MATRIX         :invalid-matrix)
  (CAIRO_STATUS_INVALID_STATUS         :invalid-status)
  (CAIRO_STATUS_NULL_POINTER           :null-pointer)
  (CAIRO_STATUS_INVALID_STRING         :invalid-string)
  (CAIRO_STATUS_INVALID_PATH_DATA      :invalid-path-data)
  (CAIRO_STATUS_READ_ERROR             :read-error)
  (CAIRO_STATUS_WRITE_ERROR            :write-error)
  (CAIRO_STATUS_SURFACE_FINISHED       :surface-finished)
  (CAIRO_STATUS_SURFACE_TYPE_MISMATCH  :surface-type-mismatch)
  (CAIRO_STATUS_PATTERN_TYPE_MISMATCH  :pattern-type-mismatch)
  (CAIRO_STATUS_INVALID_CONTENT        :invalid-content)
  (CAIRO_STATUS_INVALID_FORMAT         :invalid-format)
  (CAIRO_STATUS_INVALID_VISUAL         :invalid-visual)
  (CAIRO_STATUS_FILE_NOT_FOUND         :file-not-found)
  (CAIRO_STATUS_INVALID_DASH           :invalid-dash)
  (CAIRO_STATUS_INVALID_DSC_COMMENT    :invalid-dsc-comment)
  (CAIRO_STATUS_INVALID_INDEX          :invalid-index)
  (CAIRO_STATUS_CLIP_NOT_REPRESENTABLE :clip-not-representable)
  (CAIRO_STATUS_TEMP_FILE_ERROR        :temp-file-error)
  (CAIRO_STATUS_INVALID_STRIDE         :invalid-stride)
  (CAIRO_STATUS_FONT_TYPE_MISMATCH     :font-type-mismatch)
  (CAIRO_STATUS_USER_FONT_IMMUTABLE    :user-font-immutable)
  (CAIRO_STATUS_USER_FONT_ERROR        :user-font-error)
  (CAIRO_STATUS_NEGATIVE_COUNT         :negative-count)
  (CAIRO_STATUS_INVALID_CLUSTERS       :invalid-clusters)
  (CAIRO_STATUS_INVALID_SLANT          :invalid-slant)
  (CAIRO_STATUS_INVALID_WEIGHT         :invalid-weight))



(provide "cairo/ffi/types/enum")

;;;; End
