;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *surface2* (cairo-image-surface-create CAIRO_FORMAT_ARGB32 100 100))
#S(cairo::surface ptr 44321888 destroyed nil)
(setf *surface* (cairo-surface-create-similar *surface2*
                                              :color
                                              1
                                              1))
#S(cairo::surface ptr 44322320 destroyed nil)

(cairo-surface-finish *surface*)
(cairo-surface-flush *surface*)
(let ((o (cairo-surface-get-font-options *surface*)))
  (cairo-font-options-get-hint-style o))

(cairo-surface-get-content *surface*)
:color

(cairo-surface-mark-dirty *surface*)
nil
(cairo-surface-mark-dirty-rectangle *surface* 1 1 1 1)
nil
(cairo-surface-set-device-offset *surface* 100 200)
nil
(cairo-surface-get-device-offset *surface*)
100.0d0
200.0d0

(cairo-surface-set-fallback-resolution *surface* 1.2 10)
(cairo-surface-get-fallback-resolution *surface*)
nil
(cairo-surface-get-type *surface*)
:image
(cairo-surface-get-reference-count *surface*)
1
