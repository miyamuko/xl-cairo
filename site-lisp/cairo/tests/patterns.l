;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *pattern* (cairo-pattern-create-rgb 0 -12 0))
(cairo-pattern-reference *pattern*)
(cairo-pattern-status *pattern*)
(cairo-pattern-get-reference-count *pattern*)
(cairo-pattern-destroy *pattern*)

(cairo-pattern-get-type *pattern*)
(cairo-pattern-set-extend *pattern* :repeat)
(cairo-pattern-get-extend *pattern*)
(cairo-pattern-set-filter *pattern* :best)
(cairo-pattern-get-filter *pattern*)
(cairo-pattern-set-matrix *pattern* (cairo-matrix-init 1 2 3 4 5 6))
(cairo-pattern-get-matrix *pattern*)

(setf *pattern* (cairo-pattern-create-rgba 1 1 1 1))
(cairo-pattern-get-rgba *pattern*)

(setf *surface* (cairo-image-surface-create :argb32 100 100))
(setf *pattern* (cairo-pattern-create-for-surface *surface*))
(cairo-pattern-get-surface *pattern*)


(setf *pattern* (cairo-pattern-create-linear 1 1 100 100))
(cairo-pattern-get-linear-points *pattern*)

(setf *pattern* (cairo-pattern-create-radial 1 1 10 2 2 20))
(cairo-pattern-get-radial-circles *pattern*)


(cairo-pattern-add-color-stop-rgb *pattern* 1 1 0 0)
nil
(cairo-pattern-add-color-stop-rgba *pattern* 1 1 1 1 1)
nil
(cairo-pattern-get-color-stop-rgba *pattern* 0)
(cairo-pattern-get-color-stop-rgba *pattern* 1)
(cairo-pattern-get-color-stop-count *pattern*)
(cairo-pattern-get-color-stop-rgba-list *pattern*)

