;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/drawing/paths.l
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

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-copy-path
(define-cairo-api
  path-t*
  %cairo-copy-path ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-copy-path-flat
(define-cairo-api
  path-t*
  %cairo-copy-path-flat ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-path-destroy
(define-cairo-api
  c:void
  %cairo-path-destroy ((path-t* path)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-append-path
(define-cairo-api
  c:void
  %cairo-append-path ((cairo-t* cr)
                      (path-t* path)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-has-current-point
(define-cairo-api
  bool-t
  %cairo-has-current-point ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-get-current-point
(define-cairo-api
  c:void
  %cairo-get-current-point ((cairo-t* cr)
                            (double* x)
                            (double* y)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-new-path
(define-cairo-api
  c:void
  %cairo-new-path ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-new-sub-path
(define-cairo-api
  c:void
  %cairo-new-sub-path ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-close-path
(define-cairo-api
  c:void
  %cairo-close-path ((cairo-t* cr)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-arc
(define-cairo-api
  c:void
  %cairo-arc ((cairo-t* cr)
              (c:double xc)
              (c:double yc)
              (c:double radius)
              (c:double angle1)
              (c:double angle2)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-arc-negative
(define-cairo-api
  c:void
  %cairo-arc-negative ((cairo-t* cr)
                       (c:double xc)
                       (c:double yc)
                       (c:double radius)
                       (c:double angle1)
                       (c:double angle2)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-curve-to
(define-cairo-api
  c:void
  %cairo-curve-to ((cairo-t* cr)
                   (c:double x1)
                   (c:double y1)
                   (c:double x2)
                   (c:double y2)
                   (c:double x3)
                   (c:double y3)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-line-to
(define-cairo-api
  c:void
  %cairo-line-to ((cairo-t* cr)
                  (c:double x)
                  (c:double y)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-move-to
(define-cairo-api
  c:void
  %cairo-move-to ((cairo-t* cr)
                  (c:double x)
                  (c:double y)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-rectangle
(define-cairo-api
  c:void
  %cairo-rectangle ((cairo-t* cr)
                    (c:double x)
                    (c:double y)
                    (c:double width)
                    (c:double height)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-glyph-path
(define-cairo-api
  c:void
  %cairo-glyph-path ((cairo-t* cr)
                     (glyph-t* glyphs)
                     (c:int num-glyphs)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-text-path
(define-cairo-api
  c:void
  %cairo-text-path ((cairo-t* cr)
                    (c:char* utf8)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-rel-curve-to
(define-cairo-api
  c:void
  %cairo-rel-curve-to ((cairo-t* cr)
                       (c:double dx1)
                       (c:double dy1)
                       (c:double dx2)
                       (c:double dy2)
                       (c:double dx3)
                       (c:double dy3)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-rel-line-to
(define-cairo-api
  c:void
  %cairo-rel-line-to ((cairo-t* cr)
                      (c:double dx)
                      (c:double dy)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-rel-move-to
(define-cairo-api
  c:void
  %cairo-rel-move-to ((cairo-t* cr)
                      (c:double dx)
                      (c:double dy)))

;; http://www.cairographics.org/manual/cairo-paths.html#cairo-path-extents
(define-cairo-api
  c:void
  %cairo-path-extents ((cairo-t* cr)
                       (double* x1)
                       (double* y1)
                       (double* x2)
                       (double* y2)))



(provide "cairo/ffi/drawing/paths")

;;;; End
