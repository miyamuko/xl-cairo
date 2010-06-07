;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(cairo-format-stride-for-width :argb32 100)
400

(setf *surface* (cairo-image-surface-create CAIRO_FORMAT_RGB24 100 100))
#S(cairo::surface ptr 44322496 destroyed nil)

(setf *context* (cairo-create *surface*))
#S(cairo::context ptr 266050752 destroyed nil)

(cairo-surface-get-type *surface*)
:image

(cairo-surface-status *surface*)
nil

(cairo-surface-flush *surface*)
nil

(cairo-surface-write-to-png *surface* (desktop "foo.png"))

(cairo-destroy *context*)
(cairo-surface-destroy *surface*)

(cairo-surface-get-reference-count *surface*)


;; TODO

(setf *data* (si:make-chunk nil 9))
(setf *surface* (cairo-image-surface-create-for-data *data* :rgb24 3 3 9))
(cairo-surface-flush *surface*)

(cairo.ffi:unpack-c-array 'c:u_char
                          (si:chunk-data *data*)
                          100)

(cairo-image-surface-get-data *surface*)
55587376
(cairo-image-surface-get-format *surface*)
:rgb24
(cairo-image-surface-get-width *surface*)
3
(cairo-image-surface-get-height *surface*)
3
(cairo-image-surface-get-stride *surface*)
9
