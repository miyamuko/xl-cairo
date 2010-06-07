;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/drawing/context.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: full
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/package")
  (require "cairo/ffi/macros")
  (require "cairo/ffi/base")
  (require "cairo/ffi/types")
  (require "cairo/ffi/support/types")
  )


(in-package :cairo.ffi)

;; http://www.cairographics.org/manual/cairo-context.html#cairo-create
(define-cairo-api
  cairo-t*
  %cairo-create ((surface-t* target)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-reference
(define-cairo-api
  cairo-t*
  %cairo-reference ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-destroy
(define-cairo-api
  c:void
  %cairo-destroy ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-status
(define-cairo-api
  status-t
  %cairo-status ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-save
(define-cairo-api
  c:void
  %cairo-save ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-restore
(define-cairo-api
  c:void
  %cairo-restore ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-target
(define-cairo-api
  surface-t*
  %cairo-get-target ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-push-group
(define-cairo-api
  c:void
  %cairo-push-group ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-push-group-with-content
(define-cairo-api
  c:void
  %cairo-push-group-with-content ((cairo-t* cr)
                                  (content-t content)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-pop-group
(define-cairo-api
  pattern-t*
  %cairo-pop-group ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-pop-group-to-source
(define-cairo-api
  c:void
  %cairo-pop-group-to-source ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-group-target
(define-cairo-api
  surface-t*
  %cairo-get-group-target ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-source-rgb
(define-cairo-api
  c:void
  %cairo-set-source-rgb ((cairo-t* cr)
                         (c:double red)
                         (c:double green)
                         (c:double blue)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-source-rgba
(define-cairo-api
  c:void
  %cairo-set-source-rgba ((cairo-t* cr)
                          (c:double red)
                          (c:double green)
                          (c:double blue)
                          (c:double alpha)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-source
(define-cairo-api
  c:void
  %cairo-set-source ((cairo-t* cr)
                     (pattern-t* source)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-source-surface
(define-cairo-api
  c:void
  %cairo-set-source-surface ((cairo-t* cr)
                             (surface-t* surface)
                             (c:double x)
                             (c:double y)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-source
(define-cairo-api
  pattern-t*
  %cairo-get-source ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-antialias
(define-cairo-api
  c:void
  %cairo-set-antialias ((cairo-t* cr)
                        (antialias-t antialias)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-antialias
(define-cairo-api
  antialias-t
  %cairo-get-antialias ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-dash
(define-cairo-api
  c:void
  %cairo-set-dash ((cairo-t* cr)
                   (double* dashes)
                   (c:int num-dashes)
                   (c:double offset)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-dash-count
(define-cairo-api
  c:int
  %cairo-get-dash-count ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-dash
(define-cairo-api
  c:void
  %cairo-get-dash ((cairo-t* cr)
                   (double* dashes)
                   (double* offset)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-fill-rule
(define-cairo-api
  c:void
  %cairo-set-fill-rule ((cairo-t* cr)
                        (fill-rule-t fill-rule)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-fill-rule
(define-cairo-api
  fill-rule-t
  %cairo-get-fill-rule ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-line-cap
(define-cairo-api
  c:void
  %cairo-set-line-cap ((cairo-t* cr)
                       (line-cap-t line-cap)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-line-cap
(define-cairo-api
  line-cap-t
  %cairo-get-line-cap ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-line-join
(define-cairo-api
  c:void
  %cairo-set-line-join ((cairo-t* cr)
                        (line-join-t line-join)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-line-join
(define-cairo-api
  line-join-t
  %cairo-get-line-join ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-line-width
(define-cairo-api
  c:void
  %cairo-set-line-width ((cairo-t* cr)
                         (c:double width)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-line-width
(define-cairo-api
  c:double
  %cairo-get-line-width ((cairo-t* cr)))

(define-cairo-api
  c:void
  %cairo-get-line-width2 ((cairo-t* cr)
                          (double* out)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-miter-limit
(define-cairo-api
  c:void
  %cairo-set-miter-limit ((cairo-t* cr)
                          (c:double limit)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-miter-limit
(define-cairo-api
  c:double
  %cairo-get-miter-limit ((cairo-t* cr)))

(define-cairo-api
  c:void
  %cairo-get-miter-limit2 ((cairo-t* cr)
                           (double* out)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-operator
(define-cairo-api
  c:void
  %cairo-set-operator ((cairo-t* cr)
                       (operator-t op)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-operator
(define-cairo-api
  operator-t
  %cairo-get-operator ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-tolerance
(define-cairo-api
  c:void
  %cairo-set-tolerance ((cairo-t* cr)
                        (c:double tolerance)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-tolerance
(define-cairo-api
  c:double
  %cairo-get-tolerance ((cairo-t* cr)))

(define-cairo-api
  c:void
  %cairo-get-tolerance2 ((cairo-t* cr)
                         (double* out)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-clip
(define-cairo-api
  c:void
  %cairo-clip ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-clip-preserve
(define-cairo-api
  c:void
  %cairo-clip-preserve ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-clip-extents
(define-cairo-api
  c:void
  %cairo-clip-extents ((cairo-t* cr)
                       (double* x1)
                       (double* y1)
                       (double* x2)
                       (double* y2)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-reset-clip
(define-cairo-api
  c:void
  %cairo-reset-clip ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-rectangle-list-destroy
(define-cairo-api
  c:void
  %cairo-rectangle-list-destroy ((rectangle-list-t* rectangle-list)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-copy-clip-rectangle-list
(define-cairo-api
  rectangle-list-t*
  %cairo-copy-clip-rectangle-list ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-fill
(define-cairo-api
  c:void
  %cairo-fill ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-fill-preserve
(define-cairo-api
  c:void
  %cairo-fill-preserve ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-fill-extents
(define-cairo-api
  c:void
  %cairo-fill-extents ((cairo-t* cr)
                       (double* x1)
                       (double* y1)
                       (double* x2)
                       (double* y2)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-in-fill
(define-cairo-api
  bool-t
  %cairo-in-fill ((cairo-t* cr)
                  (c:double x)
                  (c:double y)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-mask
(define-cairo-api
  c:void
  %cairo-mask ((cairo-t* cr)
               (pattern-t* pattern)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-mask-surface
(define-cairo-api
  c:void
  %cairo-mask-surface ((cairo-t* cr)
                       (surface-t* surface)
                       (c:double surface-x)
                       (c:double surface-y)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-paint
(define-cairo-api
  c:void
  %cairo-paint ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-paint-with-alpha
(define-cairo-api
  c:void
  %cairo-paint-with-alpha ((cairo-t* cr)
                           (c:double alpha)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-stroke
(define-cairo-api
  c:void
  %cairo-stroke ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-stroke-preserve
(define-cairo-api
  c:void
  %cairo-stroke-preserve ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-stroke-extents
(define-cairo-api
  c:void
  %cairo-stroke-extents ((cairo-t* cr)
                         (double* x1)
                         (double* y1)
                         (double* x2)
                         (double* y2)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-in-stroke
(define-cairo-api
  bool-t
  %cairo-in-stroke ((cairo-t* cr)
                    (c:double x)
                    (c:double y)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-copy-page
(define-cairo-api
  c:void
  %cairo-copy-page ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-show-page
(define-cairo-api
  c:void
  %cairo-show-page ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-reference-count
(define-cairo-api
  c:u_int
  %cairo-get-reference-count ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-set-user-data
(define-cairo-api
  status-t
  %cairo-set-user-data ((cairo-t* cr)
                        (user-data-key-t* key)
                        (c:void* user-data)
                        (destroy-func-t destroy)))

;; http://www.cairographics.org/manual/cairo-context.html#cairo-get-user-data
(define-cairo-api
  c:void*
  %cairo-get-user-data ((cairo-t* cr)
                        (user-data-key-t* key)))



(provide "cairo/ffi/drawing/context")

;;;; End
