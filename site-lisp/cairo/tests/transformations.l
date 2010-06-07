;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(defun current-matrix ()
  (matrix-to-alist (cairo-get-matrix *cr*)))

(setf *surface* (cairo-image-surface-create :argb32 100 100))
#S(cairo::surface ptr 44316080 destroyed nil)

(setf *cr* (cairo-create *surface*))
#S(cairo::context ptr 3492592 destroyed nil)

(current-matrix)
((:xx . 1.0d0) (:yx . 0.0d0) (:xy . 0.0d0) (:yy . 1.0d0) (:x0 . 0.0d0) (:y0 . 0.0d0))

(cairo-translate *cr* 10 10)
nil

(current-matrix)
((:xx . 1.0d0) (:yx . 0.0d0) (:xy . 0.0d0) (:yy . 1.0d0) (:x0 . 10.0d0) (:y0 . 10.0d0))

(cairo-scale *cr* 10 10)
nil

(current-matrix)
((:xx . 10.0d0) (:yx . 0.0d0) (:xy . 0.0d0) (:yy . 10.0d0) (:x0 . 10.0d0) (:y0 . 10.0d0))

(cairo-rotate *cr* 45)
nil
(current-matrix)
((:xx . 5.253219888177298d0) (:yx . 8.509035245341185d0) (:xy . -8.509035245341185d0) (:yy . 5.253219888177298d0) (:x0 . 10.0d0) (:y0 . 10.0d0))

(cairo-transform *cr* (cairo-matrix-init-identity))
nil

(current-matrix)
((:xx . 5.253219888177298d0) (:yx . 8.509035245341185d0) (:xy . -8.509035245341185d0) (:yy . 5.253219888177298d0) (:x0 . 10.0d0) (:y0 . 10.0d0))

(cairo-identity-matrix *cr*)
nil

(current-matrix)
((:xx . 1.0d0) (:yx . 0.0d0) (:xy . 0.0d0) (:yy . 1.0d0) (:x0 . 0.0d0) (:y0 . 0.0d0))

(cairo-set-matrix *cr* (cairo-matrix-init 1 2 3 4 5 6))
nil

(current-matrix)
((:xx . 1.0d0) (:yx . 2.0d0) (:xy . 3.0d0) (:yy . 4.0d0) (:x0 . 5.0d0) (:y0 . 6.0d0))


(cairo-get-matrix *cr*)
#S(matrix chunk #<chunk 144446412> xx 1.0d0 yx 2.0d0 xy 3.0d0 yy 4.0d0 x0 5.0d0 y0 6.0d0)

(cairo-user-to-device *cr* 1 1)
9.0d0
12.0d0

(cairo-user-to-device-distance *cr* 2 3)
11.0d0
16.0d0

(cairo-device-to-user *cr* 3 4)
1.0d0
-1.0d0

(cairo-device-to-user-distance *cr* 3 4)
0.0d0
1.0d0
