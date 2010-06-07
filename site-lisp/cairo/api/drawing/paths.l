;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/drawing/paths.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;
;;;; @auto-generate: forbidden
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/util")
  (require "cairo/ffi/drawing/paths")
  (require "cairo/ffi/support/types")
  (require "cairo/api/package")
  (require "cairo/api/types")
  (require "cairo/api/macros")
  )


(in-package :cairo)

(export '(cairo-copy-path
          cairo-copy-path-flat
          cairo-path-destroy
          cairo-append-path
          cairo-has-current-point
          cairo-get-current-point

          cairo-new-path
          cairo-new-sub-path
          cairo-close-path
          cairo-arc
          cairo-arc-negative
          cairo-curve-to
          cairo-line-to
          cairo-move-to
          cairo-rectangle
          cairo-glyph-path
          cairo-text-path
          cairo-rel-curve-to
          cairo-rel-line-to
          cairo-rel-move-to

          cairo-path-extents
          cairo-path-extents-list
          cairo-path-extents-alist

          coerce-to-cairo-path-list
          cairo-path-list
          cairo-path-list-flat
          ))


(defun cairo-copy-path (cr)
  (returning (cairo.ffi:path-t*)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-copy-path cr))))

(defun cairo-copy-path-flat (cr)
  (returning (cairo.ffi:path-t*)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-copy-path-flat cr))))

(defun cairo-path-destroy (path)
  (returning (c:void)
    (with-destroy-c-ptr (path)
      (with-c-arguments ((cairo.ffi:path-t* path))
        (%cairo-path-destroy path)))))

(defun cairo-append-path (cr path-or-path-list)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-append-path cr (coerce-to-cairo-path-chunk path-or-path-list)))))

(defun cairo-has-current-point (cr)
  (returning (cairo.ffi:bool-t)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-has-current-point cr))))

(defun cairo-get-current-point (cr)
  (with-c-out-values (((c:double x) 0)
                      ((c:double y) 0))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-get-current-point cr x y))))

(defun cairo-new-path (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-new-path cr))))

(defun cairo-new-sub-path (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-new-sub-path cr))))

(defun cairo-close-path (cr)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-close-path cr))))

(defun cairo-arc (cr xc yc radius angle1 angle2)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double xc)
                       (c:double yc)
                       (c:double radius)
                       (c:double angle1)
                       (c:double angle2))
      (%cairo-arc cr xc yc radius angle1 angle2))))

(defun cairo-arc-negative (cr xc yc radius angle1 angle2)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double xc)
                       (c:double yc)
                       (c:double radius)
                       (c:double angle1)
                       (c:double angle2))
      (%cairo-arc-negative cr xc yc radius angle1 angle2))))

(defun cairo-curve-to (cr x1 y1 x2 y2 x3 y3)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double x1)
                       (c:double y1)
                       (c:double x2)
                       (c:double y2)
                       (c:double x3)
                       (c:double y3))
      (%cairo-curve-to cr x1 y1 x2 y2 x3 y3))))

(defun cairo-line-to (cr x y)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double x)
                       (c:double y))
      (%cairo-line-to cr x y))))

(defun cairo-move-to (cr x y)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double x)
                       (c:double y))
      (%cairo-move-to cr x y))))

(defun cairo-rectangle (cr x y width height)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double x)
                       (c:double y)
                       (c:double width)
                       (c:double height))
      (%cairo-rectangle cr x y width height))))

(defun cairo-glyph-path (cr glyphs)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo::array-of-glyph-t glyphs))
      (%cairo-glyph-path cr
                         glyphs
                         (number-of glyphs 'cairo.ffi:glyph-t)))))

(defun cairo-text-path (cr str)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (cairo::utf8-char* str))
      (%cairo-text-path cr str))))

(defun cairo-rel-curve-to (cr dx1 dy1 dx2 dy2 dx3 dy3)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double dx1)
                       (c:double dy1)
                       (c:double dx2)
                       (c:double dy2)
                       (c:double dx3)
                       (c:double dy3))
      (%cairo-rel-curve-to cr dx1 dy1 dx2 dy2 dx3 dy3))))

(defun cairo-rel-line-to (cr dx dy)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double dx)
                       (c:double dy))
      (%cairo-rel-line-to cr dx dy))))

(defun cairo-rel-move-to (cr dx dy)
  (returning (c:void)
    (with-c-arguments ((cairo.ffi:cairo-t* cr)
                       (c:double dx)
                       (c:double dy))
      (%cairo-rel-move-to cr dx dy))))

(defun cairo-path-extents (cr)
  (with-c-out-values (((c:double x1) 0)
                      ((c:double y1) 0)
                      ((c:double x2) 0)
                      ((c:double y2) 0))
    (with-c-arguments ((cairo.ffi:cairo-t* cr))
      (%cairo-path-extents cr x1 y1 x2 y2))))


;;;; handmade section

(define-destroy-macro with-cairo-path
                      cairo-path-destroy)


(defun coerce-to-cairo-path-chunk (path-or-path-list)
  (cond ((listp path-or-path-list)
         (cairo-path-list->chunk path-or-path-list))
        ((path-p path-or-path-list)
         (with-c-arguments ((cairo.ffi:path-t* path-or-path-list))
           path-or-path-list))
        (t
         (error 'type-error
                :datum path-or-path-list
                :expected-type '(or path list)))))

(defun cairo-path-list->chunk (path-list)
  (let ((num-data (count-num-of-path-data path-list))
        (r (make-path-t)))
    (setf (path-t-data r) (make-path-data-chunk path-list num-data)
          (path-t-num-data r) num-data
          (path-t-status r) CAIRO_STATUS_SUCCESS)
    r))

(defun make-path-data-chunk (path-list num-data)
  (let* ((data-t-size (sizeof 'path-data-t))
         (chunk (si:make-chunk nil (* data-t-size num-data)))
         (chunk-addr (si:chunk-data chunk))
         (i 0))
    (flet ((pack-data-t (i type &optional points)
             (let ((h (make-path-data-t-header nil (+ chunk-addr (* i data-t-size)))))
               (setf (path-data-t-header-type h) type
                     (path-data-t-header-length h) (1+ (length points)))
               (incf i))
             (dolist (pt points)
               (let ((d (make-path-data-t-point nil (+ chunk-addr (* i data-t-size)))))
                 (setf (path-data-t-point-x d) (car pt)
                       (path-data-t-point-y d) (cadr pt))
                 (incf i)))
             i))
      (dolist (e path-list)
        (let ((type (car e))
              (points (cdr e)))
          (setf i (case type
                    (:move-to
                     (pack-data-t i CAIRO_PATH_MOVE_TO points))
                    (:line-to
                     (pack-data-t i CAIRO_PATH_LINE_TO points))
                    (:curve-to
                     (pack-data-t i CAIRO_PATH_CURVE_TO points))
                    (:close-path
                     (pack-data-t i CAIRO_PATH_CLOSE_PATH))
                    (t
                     (raise-cairo-argument-error "unknown path data type `~S'." type))))))
      chunk)))

(defun count-num-of-path-data (path-list)
  (reduce '+ (mapcar #'(lambda (e)
                         (1+ (path-data-num-of-points (car e))))
                     path-list)))


(defun coerce-to-cairo-path-list (path-or-path-list)
  (cond ((path-p path-or-path-list)
         (cairo-path-list0 path-or-path-list))
        ((listp path-or-path-list)
         path-or-path-list)
        (t
         (error 'type-error
                :datum path-or-path-list
                :expected-type '(or path list)))))

(defun cairo-path-list (context)
  (check-context context)
  (let ((path (cairo-copy-path context)))
    (unwind-protect
        (cairo-path-list0 path)
      (cairo-path-destroy path))))

(defun cairo-path-list-flat (context)
  (check-context context)
  (let ((path (cairo-copy-path-flat context)))
    (unwind-protect
        (cairo-path-list0 path)
      (cairo-path-destroy path))))

(defun cairo-path-list0 (path-wrapper)
  (check-path path-wrapper)
  (let* ((path-t-chunk (make-path-t nil (path-ptr path-wrapper)))
         (num-data (path-t-num-data path-t-chunk))
         (data-addr (path-t-data path-t-chunk))
         (data-t-size (sizeof 'path-data-t))
         (i 0)
         (result))
    (while (< i num-data)
      (let* ((header-addr (+ data-addr (* i data-t-size)))
             (header (make-path-data-header-from-ptr header-addr))
             (data-type (path-data-header-type header)))
        (push (cons data-type
                    (mapcar #'(lambda (point)
                                (list (path-data-t-point-x point)
                                      (path-data-t-point-y point)))
                            (unpack-c-array 'path-data-t-point
                                            (+ header-addr data-t-size)
                                            (path-data-num-of-points data-type))))
              result)
        (incf i (path-data-header-length header))))
    (reverse result)))

(defun path-data-num-of-points (type)
  (case type
    (:move-to 1)
    (:line-to 1)
    (:curve-to 3)
    (:close-path 0)
    (t (raise-cairo-argument-error "unknown path data type `~S'." type))))


(defun cairo-path-extents-list (cr)
  (multiple-value-list (cairo-path-extents cr)))

(defun cairo-path-extents-alist (cr)
  (mapcar #'cons '(:x1 :y1 :x2 :y2) (cairo-path-extents-list cr)))


(provide "cairo/api/drawing/paths")

;;;; End
