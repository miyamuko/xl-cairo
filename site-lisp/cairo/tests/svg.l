;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *svg-surface* (cairo-svg-surface-create (desktop "svg-test.svg") 300 400))
#S(cairo::surface ptr 44318976 destroyed nil)

(cairo-svg-surface-restrict-to-version *svg-surface* :1-1)
nil

(setf *context* (cairo-create *svg-surface*))
#S(cairo::context ptr 3516008 destroyed nil)

(cairo-surface-get-type *svg-surface*)
:svg

(cairo-surface-status *svg-surface*)
nil

(cairo-surface-flush *svg-surface*)
nil

(cairo-surface-destroy *svg-surface*)

(cairo-destroy *context*)

(cairo-surface-get-reference-count *svg-surface*)


(cairo-svg-get-versions)
(:1-1 :1-2)

(mapcar 'cairo-svg-version-to-string
        (cairo-svg-get-versions))
("SVG 1.1" "SVG 1.2")

(cairo-svg-version-to-string CAIRO_SVG_VERSION_1_1)
"SVG 1.1"

(cairo-svg-version-to-string CAIRO_SVG_VERSION_1_2)
"SVG 1.2"

(cairo-svg-version-to-string :1-1)
"SVG 1.1"

(cairo-svg-version-to-string :1-2)
"SVG 1.2"


