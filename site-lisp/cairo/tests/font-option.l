;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *option* (cairo-font-options-create))
#S(cairo::font-options ptr 44317840 destroyed nil)

(cairo-font-options-copy *option*)
#S(cairo::font-options ptr 44317856 destroyed nil)

(cairo-font-options-destroy *option*)

(let ((f (cairo-font-options-create)))
  (cairo-font-options-merge f *option*)
  (cairo-font-options-hash f))

(cairo-font-options-hash *option*)
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
