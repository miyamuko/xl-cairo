;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *ps-surface* (cairo-ps-surface-create (desktop "ps-test.ps") 300 400))

(cairo-ps-surface-restrict-to-level *ps-surface* :2)
nil
(cairo-ps-get-levels)

(setf *context* (cairo-create *ps-surface*))
#S(cairo::context ptr 3516008 destroyed nil)

(cairo-surface-get-type *ps-surface*)
:ps

(cairo-surface-status *ps-surface*)

(cairo-surface-flush *ps-surface*)
nil

(cairo-surface-destroy *ps-surface*)

(cairo-destroy *context*)


(cairo-ps-surface-get-eps *ps-surface*)
nil
(cairo-ps-surface-set-eps *ps-surface* nil)

(setf (cairo-ps-surface-get-eps *ps-surface*) t)
nil
(cairo-ps-surface-get-eps *ps-surface*)
t

(mapcar 'cairo-ps-level-to-string
        (cairo-ps-get-levels))
("PS Level 2" "PS Level 3")

(cairo-ps-level-to-string CAIRO_PS_LEVEL_2)
"PS Level 2"

(cairo-ps-level-to-string CAIRO_PS_LEVEL_3)
"PS Level 3"

(cairo-ps-level-to-string :2)
"PS Level 2"

(cairo-ps-level-to-string :3)
"PS Level 3"

