;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *surface* (cairo-image-surface-create CAIRO_FORMAT_ARGB32 100 100))
#S(cairo::surface ptr 44386544 destroyed nil)

(setf *cr* (cairo-create *surface*))
#S(cairo::context ptr 233901040 destroyed nil)

(with-cairo (cr *cr*)
  (format nil "~S" cr))
"#S(cairo::context ptr 145595584 destroyed nil)"
*cr*
#S(cairo::context ptr 0 destroyed t)


(cairo-reference *cr*)
(cairo-destroy *cr*)
(cairo-status *cr*)
(cairo-get-reference-count *cr*)

(cairo-save *cr*)
(cairo-restore *cr*)

(eq (cairo-get-target *cr*)
    *surface*)
(cairo::cairo-surface-get-reference-count *surface*)



(cairo-push-group *cr*)
(cairo-push-group-with-content *cr* :color)
(cairo-pop-group *cr*)
(cairo-pop-group-to-source *cr*)

(cairo-get-group-target *cr*)
(cairo-set-source-rgb *cr* 1.0 1.0 1.0)
nil
(cairo-set-source-rgba *cr* 0.1 0.2 0.3 0.4)
nil

(cairo-set-source *cr* (cairo-pattern-create-linear 1 1 1 2))
(cairo-set-source-surface *cr* (cairo-image-surface-create-from-png (desktop "foo.png")) 10 10)

(cairo-get-source *cr*)
(cairo-set-antialias *cr* :subpixel)
(cairo-get-antialias *cr*)
(cairo-set-dash *cr* '(0.2 0.05 0.05 0.05) -0.2)
(cairo::cairo-get-dash-count *cr*)
(cairo-get-dash *cr*)

(cairo-set-fill-rule *cr* :winding)
nil
(cairo-get-fill-rule *cr*)
:winding
(cairo-set-line-cap *cr* :round)
nil
(cairo-get-line-cap *cr*)
:round
(cairo-set-line-join *cr* :bevel)
nil

(cairo-get-line-join *cr*)
:bevel
(cairo-set-line-width *cr* 1)

(cairo-get-line-width *cr*)
2.0

(cairo-set-miter-limit *cr* 100)
nil

(cairo-get-miter-limit *cr*)
100.0

(cairo-set-operator *cr* :clear)
nil

(cairo-get-operator *cr*)
:clear

(setf (cairo-get-operator *cr*) :in)

(cairo-get-operator *cr*)

(cairo-set-tolerance *cr* 10)
nil

(cairo-get-tolerance *cr*)
10.0

(cairo-clip *cr*)
(cairo-clip-preserve *cr*)
(cairo-clip-extents *cr*)
(cairo-clip-extents-alist *cr*)
(cairo-clip-extents-list *cr*)
(cairo-reset-clip *cr*)
(cairo-clip-rectangle-list *cr*)

(cairo-fill *cr*)
(cairo-fill-preserve *cr*)
(cairo-fill-extents *cr*)
(cairo-fill-extents-alist *cr*)
(cairo-fill-extents-list *cr*)
(cairo-in-fill *cr* 0 0)

(cairo-mask *cr* (cairo-pattern-create-radial 1 1 1 2 2 2))
(cairo-mask-surface *cr* (cairo-image-surface-create :argb32 10 10) 10 10)

(cairo-paint *cr*)
(cairo-paint-with-alpha *cr* 1)

(cairo-stroke *cr*)
(cairo-move-to *cr* 1 1)
(cairo-move-to *cr* 100 20)
(cairo-stroke-preserve *cr*)
(cairo-stroke-extents *cr*)
(cairo-stroke-extents-alist *cr*)
(cairo-stroke-extents-list *cr*)

(cairo-in-stroke *cr* 1 1)

(cairo-copy-page *cr*)
(cairo-show-page *cr*)
