;;;;
;;;; hearts.l - ハートをランダムに描くサンプル
;;;;
;;;; cl-cairo2 の example の移植
;;;; http://common-lisp.net/project/cl-cairo2/tutorial.pdf
;;;;

(load "_runner.l")

(do-snippets (:normalize nil :width 600 :height 600)
  (dotimes (i 50)
    (let ((scaling (+ 5d0 (random 40d0)))
          (max-angle 40))
      (with-cairo-save (cr)
        (cairo-rotate cr (degree->radian (- (random max-angle) (/ max-angle 2))))
        (with-cairo-fill (cr)
          (cairo-set-source-rgba cr 1 0 0 (+ 0.1 (random 0.7)))
          (cairo-heart cr (random width) (random height) scaling))))))
