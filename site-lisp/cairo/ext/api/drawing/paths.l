;;;; -*- mode: lisp; package: cairo.ext -*-
;;;;
;;;; File: cairo/ext/api/drawing/paths.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/api")
  (require "cairo/ext/package")
  (require "cairo/ext/util")
  )

(in-package :cairo.ext)

(export '(cairo-map-path-onto
          ))

(defun cairo-map-path-onto (cr path)
  (let* ((path-list (coerce-to-cairo-path-list path))
         (parmeterized-path (parameterize-path path-list)))
    (let ((transformed-path (transform-path
                             (cairo-path-list cr)
                             #'(lambda (x y)
                                 (map-path-onto0 path-list parmeterized-path x y)))))
      (cairo-new-path cr)
      (cairo-append-path cr transformed-path))))

(defun map-path-onto0 (path parameterized-path x y)
  (let ((d x)
        (i -1)
        current-point type points)
    (dolist (type/points path)
      (setf type (car type/points)
            points (cdr type/points))
      (incf i)
      (when (< d (nth i parameterized-path))
        (return))
      (decf d (nth i parameterized-path))
      (case type
        (:move-to
         (setf current-point (nth 0 points)))
        (:line-to
         (setf current-point (nth 0 points)))
        (:curve-to
         (setf current-point (nth 2 points)))
        (:close-path
         )
        (t
         (raise-cairo-argument-error "unknown path type: `(~S ~S)'"
                                     type points))))
    (case type
      (:move-to
       (list x y))
      (:line-to
       (macrolet ((calc-new (curr n ratio)
                    `(+ (* ,curr (- 1 ,ratio)) (* ,n ,ratio)))
                  (calc-d (curr n)
                    `(- (- ,curr ,n))))
         (let ((ratio (/ d (nth i parameterized-path)))
               (lx (car (nth 0 points)))
               (ly (cadr (nth 0 points)))
               (curr-x (car current-point))
               (curr-y (cadr current-point)))
           (let ((new-x (calc-new curr-x lx ratio))
                 (new-y (calc-new curr-y ly ratio))
                 (dx (calc-d curr-x lx))
                 (dy (calc-d curr-y ly)))
             (setf ratio (/ y (nth i parameterized-path)))
             (list (+ new-x (* (- dy) ratio)) (+ new-y (* dx ratio)))))))
      (:curve-to
       (macrolet ((calc-new (curr n0 n1 n2 ratio)
                    `(+ (* ,curr   (- 1 ,ratio) (- 1 ,ratio) (- 1 ,ratio))
                        (* 3 ,n0   (- 1 ,ratio) (- 1 ,ratio)      ,ratio)
                        (* 3 ,n1   (- 1 ,ratio)      ,ratio       ,ratio)
                        (*   ,n2        ,ratio       ,ratio       ,ratio)))
                  (calc-d (curr n0 n1 n2 ratio)
                    `(+ (* -3 ,curr (- 1 ,ratio) (- 1 ,ratio))
                        (*  3 ,n0   (- 1 (+ (* 4 ,ratio) (* 3 ,ratio ,ratio))))
                        (*  3 ,n1        (- (* 2 ,ratio) (* 3 ,ratio ,ratio)))
                        (*  3 ,n2        ,ratio       ,ratio))))
         (let ((ratio (/ d (nth i parameterized-path)))
               (cx0 (car (nth 0 points)))
               (cy0 (cadr (nth 0 points)))
               (cx1 (car (nth 1 points)))
               (cy1 (cadr (nth 1 points)))
               (cx2 (car (nth 2 points)))
               (cy2 (cadr (nth 2 points)))
               (curr-x (car current-point))
               (curr-y (cadr current-point)))
           (let ((new-x (calc-new curr-x cx0 cx1 cx2 ratio))
                 (new-y (calc-new curr-y cy0 cy1 cy2 ratio))
                 (dx (calc-d curr-x cx0 cx1 cx2 ratio))
                 (dy (calc-d curr-y cy0 cy1 cy2 ratio)))
             (setf ratio (/ y (sqrt (expt dx 2) (expt dy 2))))
             (list (+ new-x (* (- dy) ratio)) (+ new-y (* dx ratio)))))))
      (:close-path
       (list x y))
      (t
       (raise-cairo-argument-error "unknown path type: `(~S ~S)'"
                                   type points)))))

(defun transform-path (path fn)
  (mapcar #'(lambda (type/points)
              (cons (car type/points)
                    (mapcar #'(lambda (pt)
                                (funcall fn (car pt) (cadr pt)))
                            (cdr type/points))))
          path))

(defun parameterize-path (path)
  (let (*current-point*)
    (declare (special *current-point*))
    (mapcar #'(lambda (e)
                (parameterize-path0 (car e) (cdr e)))
            path)))

(defun parameterize-path0 (type points)
  (case type
    (:move-to
     (setf *current-point* (nth 0 points))
     0)
    (:line-to
     (prog1
         (distance *current-point* (nth 0 points))
       (setf *current-point* (nth 0 points))))
    (:curve-to
     (prog1
         (+ (distance *current-point* (nth 0 points))
            (distance (nth 0 points) (nth 1 points))
            (distance (nth 1 points) (nth 2 points)))
       (setf *current-point* (nth 2 points))))
    (:close-path
     0)
    (t
     (raise-cairo-argument-error "unknown path type: `(~S ~S)'"
                                 type points))))


(provide "cairo/ext/api/drawing/paths")

;;;; End
