;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")
t

(setf *matrix* (cairo-matrix-init 1 2 3 4 5 6))
#S(matrix chunk #<chunk 144446380> xx 1.0 yx 2.0 xy 3.0 yy 4.0 x0 5.0 y0 6.0)

(matrix-x0 *matrix*)
5.0

(matrix-to-alist *matrix*)
((:xx . 1.0) (:yx . 2.0) (:xy . 3.0) (:yy . 4.0) (:x0 . 5.0) (:y0 . 6.0))

(setf *matrix* (cairo-matrix-init-identity))
#S(matrix chunk #<chunk 144446364> xx 1.0 yx 0.0 xy 0.0 yy 1.0 x0 0.0 y0 0.0)

(setf *matrix* (cairo-matrix-init-translate 1 2))
#S(matrix chunk #<chunk 144446348> xx 1.0 yx 0.0 xy 0.0 yy 1.0 x0 1.0 y0 2.0)

(setf *matrix* (cairo-matrix-init-scale 3 3))
#S(matrix chunk #<chunk 144446332> xx 3.0 yx 0.0 xy 0.0 yy 3.0 x0 0.0 y0 0.0)

(setf *matrix* (cairo-matrix-init-rotate 45))
#S(matrix chunk #<chunk 144446316> xx 0.525322 yx 0.8509035 xy -0.8509035 yy 0.525322 x0 0.0 y0 0.0)

(cairo-matrix-translate *matrix* 2 3)
nil
*matrix*
#S(matrix chunk #<chunk 144446316> xx 0.525322 yx 0.8509035 xy -0.8509035 yy 0.525322 x0 0.0 y0 0.0)

(cairo-matrix-scale *matrix* 3 4)
nil

*matrix*
#S(matrix chunk #<chunk 144446316> xx 0.525322 yx 0.8509035 xy -0.8509035 yy 0.525322 x0 0.0 y0 0.0)

(setf *matrix* (cairo-matrix-init 1 0 0 1 0 0))
#S(matrix chunk #<chunk 144446396> xx 1.0d0 yx 0.0d0 xy 0.0d0 yy 1.0d0 x0 0.0d0 y0 0.0d0)
(cairo-matrix-rotate *matrix* 180)
nil
*matrix*
#S(matrix chunk #<chunk 144446396> xx 1.0d0 yx 0.0d0 xy 0.0d0 yy 1.0d0 x0 0.0d0 y0 0.0d0)

(setf *matrix* (cairo-matrix-init-rotate 180))
#S(matrix chunk #<chunk 144446444> xx -0.5984600690578581d0 yx -0.8011526357338304d0 xy 0.8011526357338304d0 yy -0.5984600690578581d0 x0 0.0d0 y0 0.0d0)
*matrix*
#S(matrix chunk #<chunk 144446444> xx -0.5984600690578581d0 yx -0.8011526357338304d0 xy 0.8011526357338304d0 yy -0.5984600690578581d0 x0 0.0d0 y0 0.0d0)


(setf *matrix* (cairo-matrix-init 1 2 3 4 5 6))
#S(matrix chunk #<chunk 144446412> xx 1.0d0 yx 2.0d0 xy 3.0d0 yy 4.0d0 x0 5.0d0 y0 6.0d0)
(cairo-matrix-invert *matrix*)
nil
*matrix*
#S(matrix chunk #<chunk 144446412> xx 1.0d0 yx 2.0d0 xy 3.0d0 yy 4.0d0 x0 5.0d0 y0 6.0d0)


(setf *matrix*
(cairo-matrix-multiply (cairo-matrix-init 3 3 3 3 3 3)
                       (cairo-matrix-init 1 2 3 1 2 3))
)
#S(matrix chunk #<chunk 144446348> xx 12.0d0 yx 9.0d0 xy 12.0d0 yy 9.0d0 x0 14.0d0 y0 12.0d0)


(cairo-matrix-transform-distance (cairo-matrix-init 1 2 3 4 5 6)
                                 10
                                 20)
70.0d0
100.0d0


(cairo-matrix-transform-point (cairo-matrix-init-identity)
                              10
                              20)
10.0d0
20.0d0

