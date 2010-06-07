;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/drawing/context.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/util/symbol")
  (require "cairo/ffi/drawing/context")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-create
          cairo-destroy
          cairo-save
          cairo-restore
          cairo-get-target
          cairo-push-group
          cairo-pop-group
          cairo-get-group-target
          cairo-set-source-rgb
          cairo-set-source-rgba
          cairo-set-source
          cairo-set-source-surface
          cairo-get-source
          cairo-set-antialias
          cairo-get-antialias
          cairo-set-dash
          cairo-get-dash
          cairo-set-fill-rule
          cairo-get-fill-rule
          cairo-set-line-cap
          cairo-get-line-cap
          cairo-set-line-join
          cairo-get-line-join
          cairo-set-line-width
          cairo-get-line-width
          cairo-set-miter-limit
          cairo-get-miter-limit
          cairo-set-operator
          cairo-get-operator
          cairo-set-tolerance
          cairo-get-tolerance
          cairo-clip
          cairo-clip-preserve
          cairo-clip-extents
          cairo-reset-clip
          cairo-fill
          cairo-fill-preserve
          cairo-fill-extents
          cairo-in-fill
          cairo-mask
          cairo-mask-surface
          cairo-paint
          cairo-paint-with-alpha
          cairo-stroke
          cairo-stroke-preserve
          cairo-stroke-extents
          cairo-in-stroke
          cairo-copy-page
          cairo-show-page

          with-cairo-group
          call-with-cairo-group

          cairo-clip-extents-alist
          cairo-fill-extents-alist
          cairo-stroke-extents-alist

          cairo-clip-extents-list
          cairo-fill-extents-list
          cairo-stroke-extents-list

          cairo-clip-rectangle-list
          ))


(defun cairo-create (target)
  (checking-status-using (cairo-status)
    (returning (cairo.ffi:cairo-t*)
      (with-c-arguments ((cairo.ffi:surface-t* target))
        (%cairo-create target)))))

(defun cairo-reference (cr)
  (returning (cairo.ffi:cairo-t*)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-reference cr))))

(defun cairo-destroy (cr)
  (returning (c:void)
    (with-destroy-c-ptr (cr)
      (with-c-arguments ((cairo.ffi:cairo-t* cr))
        (%cairo-destroy cr)))))

(defun cairo-status (cr)
  (returning (cairo.ffi:status-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-status cr))))

(defun cairo-save (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-save cr))))

(defun cairo-restore (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-restore cr))))

(defun cairo-get-target (cr)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-c-arguments ((cairo.ffi:cairo-t* cr))
        (%cairo-get-target cr)))))

(defun cairo-push-group (cr &optional content)
  (when content
    (return-from cairo-push-group
      (cairo-push-group-with-content cr content)))
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-push-group cr))))

(defun cairo-push-group-with-content (cr content)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:content-t content))
      (%cairo-push-group-with-content cr content))))

(defun cairo-pop-group (cr &key to-source)
  (when to-source
    (return-from cairo-pop-group
      (cairo-pop-group-to-source cr)))
  (returning (cairo.ffi:pattern-t*)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-pop-group cr))))

(defun cairo-pop-group-to-source (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-pop-group-to-source cr))))

(defun cairo-get-group-target (cr)
  (checking-status-using (cairo-surface-status)
    (returning (cairo.ffi:surface-t*)
      (with-c-arguments ((cairo.ffi:cairo-t* cr))
        (%cairo-get-group-target cr)))))

(defun cairo-set-source-rgb (cr red green blue)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double red)
                       (c:double green)
                       (c:double blue))
      (%cairo-set-source-rgb cr red green blue))))

(defun cairo-set-source-rgba (cr red green blue alpha)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double red)
                       (c:double green)
                       (c:double blue)
                       (c:double alpha))
      (%cairo-set-source-rgba cr red green blue alpha))))

(defun cairo-set-source (cr source)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:pattern-t* source))
      (%cairo-set-source cr source))))

(defun cairo-set-source-surface (cr surface x y)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:surface-t* surface)
                       (c:double x)
                       (c:double y))
      (%cairo-set-source-surface cr surface x y))))

(defun cairo-get-source (cr)
  (returning (cairo.ffi:pattern-t*)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-source cr))))

(defun cairo-set-antialias (cr antialias)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:antialias-t antialias))
      (%cairo-set-antialias cr antialias))))

(defun cairo-get-antialias (cr)
  (returning (cairo.ffi:antialias-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-antialias cr))))

(defun cairo-set-dash (cr dashes offset)
  (returning (c:void)
    (checking-status-using (cairo-status cr)
      (with-c-arguments ((cairo.ffi:cairo-t* cr)
                         (cairo::array-of-double dashes)
                         (c:double offset))
        (%cairo-set-dash cr dashes
                         (number-of dashes 'c:double)
                         offset)))))

(defun cairo-get-dash-count (cr)
  (returning (c:int)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-dash-count cr))))

(defun cairo-get-dash (cr)
  (let* ((n (cairo-get-dash-count cr))
         (dashes (make-array-chunk-for 'c:double n))
         (offset (make-double-chunk)))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-dash cr dashes offset))
    (let ((c (c->lisp-converter 'c:double)))
      (values (unpack-array-of-double dashes n)
              (funcall c (unpack-double offset))))))

(defun cairo-set-fill-rule (cr fill-rule)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:fill-rule-t fill-rule))
      (%cairo-set-fill-rule cr fill-rule))))

(defun cairo-get-fill-rule (cr)
  (returning (cairo.ffi:fill-rule-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-fill-rule cr))))

(defun cairo-set-line-cap (cr line-cap)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:line-cap-t line-cap))
      (%cairo-set-line-cap cr line-cap))))

(defun cairo-get-line-cap (cr)
  (returning (cairo.ffi:line-cap-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-line-cap cr))))

(defun cairo-set-line-join (cr line-join)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:line-join-t line-join))
      (%cairo-set-line-join cr line-join))))

(defun cairo-get-line-join (cr)
  (returning (cairo.ffi:line-join-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-line-join cr))))

(defun cairo-set-line-width (cr width)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double width))
      (%cairo-set-line-width cr width))))

(defun cairo-get-line-width (cr)
  (with-c-out-values (((c:double out) 0))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-line-width2 cr out))))

(defun cairo-set-miter-limit (cr limit)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double limit))
      (%cairo-set-miter-limit cr limit))))

(defun cairo-get-miter-limit (cr)
  (with-c-out-values (((c:double out) 0))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-miter-limit2 cr out))))

(defun cairo-set-operator (cr op)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:operator-t op))
      (%cairo-set-operator cr op))))

(defun cairo-get-operator (cr)
  (returning (cairo.ffi:operator-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-operator cr))))

(defun cairo-set-tolerance (cr tolerance)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double tolerance))
      (%cairo-set-tolerance cr tolerance))))

(defun cairo-get-tolerance (cr)
  (with-c-out-values (((c:double out) 0))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-tolerance2 cr out))))

(defun cairo-clip (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-clip cr))))

(defun cairo-clip-preserve (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-clip-preserve cr))))

(defun cairo-clip-extents (cr)
  (with-c-out-values (((c:double x1) 0)
                      ((c:double y1) 0)
                      ((c:double x2) 0)
                      ((c:double y2) 0))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-clip-extents cr x1 y1 x2 y2))))

(defun cairo-reset-clip (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-reset-clip cr))))

(defun cairo-rectangle-list-destroy (rectangle-list)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:rectangle-list-t* rectangle-list))
      (%cairo-rectangle-list-destroy rectangle-list))))

(defun cairo-copy-clip-rectangle-list (cr)
  (returning (cairo.ffi:rectangle-list-t*)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-copy-clip-rectangle-list cr))))

(defun cairo-fill (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-fill cr))))

(defun cairo-fill-preserve (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-fill-preserve cr))))

(defun cairo-fill-extents (cr)
  (with-c-out-values (((c:double x1) 0)
                      ((c:double y1) 0)
                      ((c:double x2) 0)
                      ((c:double y2) 0))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-fill-extents cr x1 y1 x2 y2))))

(defun cairo-in-fill (cr x y)
  (returning (cairo.ffi:bool-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double x)
                       (c:double y))
      (%cairo-in-fill cr x y))))

(defun cairo-mask (cr pattern)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:pattern-t* pattern))
      (%cairo-mask cr pattern))))

(defun cairo-mask-surface (cr surface surface-x surface-y)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo.ffi:surface-t* surface)
                       (c:double surface-x)
                       (c:double surface-y))
      (%cairo-mask-surface cr surface surface-x surface-y))))

(defun cairo-paint (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-paint cr))))

(defun cairo-paint-with-alpha (cr alpha)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double alpha))
      (%cairo-paint-with-alpha cr alpha))))

(defun cairo-stroke (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-stroke cr))))

(defun cairo-stroke-preserve (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-stroke-preserve cr))))

(defun cairo-stroke-extents (cr)
  (with-c-out-values (((c:double x1) 0)
                      ((c:double y1) 0)
                      ((c:double x2) 0)
                      ((c:double y2) 0))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-stroke-extents cr x1 y1 x2 y2))))

(defun cairo-in-stroke (cr x y)
  (returning (cairo.ffi:bool-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double x)
                       (c:double y))
      (%cairo-in-stroke cr x y))))

(defun cairo-copy-page (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-copy-page cr))))

(defun cairo-show-page (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-show-page cr))))

(defun cairo-get-reference-count (cr)
  (returning (c:u_int)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-reference-count cr))))


;;;; handmade section

(define-destroy-macro with-cairo
                      cairo-destroy)

(define-arround-macro1 with-cairo-save
                       :before cairo-save
                       :after cairo-restore
                       :protect t)

(define-arround-macro1 with-cairo-fill
                       :after cairo-fill)

(define-arround-macro1 with-cairo-fill-preserve
                       :after cairo-fill-preserve)

(define-arround-macro1 with-cairo-stroke
                       :after cairo-stroke)

(define-arround-macro1 with-cairo-stroke-preserve
                       :after cairo-stroke-preserve)

(defun call-with-cairo-group (func cr &key (content nil) (to-source t))
  (let (r)
    (cairo-push-group cr content)
    (unwind-protect
        (setf r (funcall func cr))
      (if to-source
          (cairo-pop-group-to-source cr)
        (setf r (cairo-pop-group cr))))
    r))

(defmacro with-cairo-group ((cr &key (content nil) (to-source t)) &body body)
  (with-gensyms (gcr)
    `(let ((,gcr ,cr))
       (call-with-cairo-group (lambda (gcr) (,@body)) gcr
                              :content ,content
                              :to-source ,to-source))))
(setf (get 'with-cairo-group 'ed:lisp-indent-hook) 'with-open-file)


(defun cairo-clip-extents-list (cr)
  (multiple-value-list (cairo-clip-extents cr)))

(defun cairo-clip-extents-alist (cr)
  (mapcar #'cons '(:x1 :y1 :x2 :y2) (cairo-clip-extents-list cr)))


(defun cairo-fill-extents-list (cr)
  (multiple-value-list (cairo-fill-extents cr)))

(defun cairo-fill-extents-alist (cr)
  (mapcar #'cons '(:x1 :y1 :x2 :y2) (cairo-fill-extents-list cr)))


(defun cairo-stroke-extents-list (cr)
  (multiple-value-list (cairo-stroke-extents cr)))

(defun cairo-stroke-extents-alist (cr)
  (mapcar #'cons '(:x1 :y1 :x2 :y2) (cairo-stroke-extents-list cr)))


(defun cairo-clip-rectangle-list (cr)
  (let ((rect-list (cairo-copy-clip-rectangle-list cr)))
    (unwind-protect
        (progn
          (raise-error-if-cairo-status-is-not-success (rectangle-list-status rect-list))
          (mapcar #'rectangle-to-alist
                  (mapcar #'make-rectangle-from-chunk
                          (unpack-c-array 'cairo.ffi:rectangle-t
                                          (rectangle-list-rectangles rect-list)
                                          (rectangle-list-num-rectangles rect-list)))))
      (cairo-rectangle-list-destroy rect-list))))

(defsetf
    cairo-get-antialias
    cairo-set-antialias)

(defsetf
    cairo-get-fill-rule
    cairo-set-fill-rule)

(defsetf
    cairo-get-line-cap
    cairo-set-line-cap)

(defsetf
    cairo-get-line-join
    cairo-set-line-join)

(defsetf
    cairo-get-line-width
    cairo-set-line-width)

(defsetf
    cairo-get-miter-limit
    cairo-set-miter-limit)

(defsetf
    cairo-get-operator
    cairo-set-operator)

(defsetf
    cairo-get-tolerance
    cairo-set-tolerance)


(provide "cairo/api/drawing/context")

;;;; End
