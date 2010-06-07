;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *face* (cairo-win32-font-face-create "ÉÅÉCÉäÉI"))
#S(cairo::font-face ptr 44344704 destroyed nil)

(cairo-win32-font-face-create-for-hfont)

(cairo-font-face-get-type *face*)
:win32

(cairo-font-face-destroy *face*)
cairo: argument error: destroyed object passed!.


(setf *font*
      (cairo-scaled-font-create
       *face*
       (cairo-matrix-init-identity)
       (cairo-matrix-init-identity)
       (cairo-font-options-create)))
#S(cairo::scaled-font ptr 3493008 destroyed nil)

(cairo-win32-scaled-font-select-font *font* (winapi:GetDC 0))
nil

(cairo-win32-scaled-font-done-font *font*)

(cairo-win32-scaled-font-get-metrics-factor *font*)
0.03125

(cairo-win32-scaled-font-get-logical-to-device *font*)
#S(matrix chunk #<chunk 140055532> xx 0.03125 yx 0.0 xy 0.0 yy 0.03125 x0 0.0 y0 0.0)

(cairo-win32-scaled-font-get-device-to-logical *font*)
#S(matrix chunk #<chunk 140055516> xx 32.0 yx 0.0 xy 0.0 yy 32.0 x0 0.0 y0 0.0)
