;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *scaled-font*
      (cairo-scaled-font-create
       (cairo-win32-font-face-create "メイリオ")
       (cairo-matrix-init-identity)
       (cairo-matrix-init-identity)
       (cairo-font-options-create)))
#S(cairo::scaled-font ptr 3517072 destroyed nil)

(cairo-scaled-font-status *scaled-font*)
nil

(cairo-scaled-font-reference *scaled-font*)
#S(cairo::scaled-font ptr 145598184 destroyed nil)

(cairo-scaled-font-get-reference-count *scaled-font*)
2

(cairo-scaled-font-destroy *scaled-font*)
cairo: error: destroyed object passed!.


(cairo::cairo-scaled-font-extents-alist *scaled-font*)



(cairo-scaled-font-text-extents *scaled-font* "m")
(cairo-scaled-font-text-extents *scaled-font* "abcあいう")
#S(text-extents chunk #<chunk 144446412> x-bearing 0.0 y-bearing -2.0 width 9.0 height 3.0 x-advance 9.0 y-advance 0.0)

(cairo-scaled-font-glyph-extents *scaled-font* (make-glyph :index 42 :x 10 :y 20))
(cairo-scaled-font-glyph-extents *scaled-font* (list (make-glyph :index 42 :x 10 :y 20)))
#S(text-extents chunk #<chunk 144446300> x-bearing 0.0 y-bearing -2.0 width 1.0 height 2.0 x-advance 1.0 y-advance 0.0)

(cairo-scaled-font-get-font-face *scaled-font*)
(cairo-scaled-font-get-font-options *scaled-font*)
(cairo-scaled-font-get-font-matrix *scaled-font*)
(cairo-scaled-font-get-ctm *scaled-font*)
(cairo-scaled-font-get-scale-matrix *scaled-font*)


(cairo-scaled-font-get-type *scaled-font*)
:win32


(setf *option* (cairo-font-options-create))
#S(cairo::font-options ptr 44316192 destroyed nil)

(cairo-font-options-copy *option*)
#S(cairo::font-options ptr 44316208 destroyed nil)

(cairo-font-options-destroy *option*)

(let ((f (cairo-font-options-create)))
  (cairo-font-options-merge f *option*)
  (cairo-font-options-hash f))
66065
(cairo-font-options-hash *option*)
66065
(cairo-font-options-equal *option* (cairo-font-options-copy *option*))
(cairo-font-options-equal *option* (cairo-font-options-create))
nil
(cairo-font-options-set-antialias *option* :none)
nil
(cairo-font-options-get-antialias *option*)
:none
(cairo-font-options-set-subpixel-order *option* :rgb)
nil
(cairo-font-options-get-subpixel-order *option*)
:rgb
(cairo-font-options-set-hint-style *option* :slight)
nil
(cairo-font-options-get-hint-style *option*)
:slight
(cairo-font-options-set-hint-metrics *option* :off)
nil
(cairo-font-options-get-hint-metrics *option*)
:off

(setf (cairo-font-options-get-hint-metrics *option*) :on)


(with-cairo-font-face (face (cairo-win32-font-face-create "メイリオ"))
  (with-cairo-scaled-font (scaled-font (cairo-scaled-font-create
                                        face
                                        (cairo-matrix-init-identity)
                                        (cairo-matrix-init-identity)
                                        (cairo-font-options-create)))
    (cairo-scaled-font-text-extents scaled-font "あ")
    (cairo.api::cairo-scaled-font-status scaled-font)))


    (cairo-scaled-font-text-to-glyphs scaled-font 1 1 "あいうあああ")
    ))
