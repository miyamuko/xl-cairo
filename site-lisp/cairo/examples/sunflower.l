;; http://d.hatena.ne.jp/ku-ma-me/20071203/p1 ‚ğˆÚA

(load "_runner.l")

(defparameter S 250)
(defparameter L 1000)

(defun memoize (fn)
  (let ((cache (make-hash-table :test #'equal)))
    #'(lambda (&rest args)
        (multiple-value-bind (val win)
            (gethash args cache)
          (if win
              val
            (setf (gethash args cache)
                  (apply fn args)))))))

(defun fib (n)
  (if (<= n 1)
      n
    (+ (fib (- n 1)) (fib (- n 2)))))

(setf (symbol-function 'fib) (memoize #'fib))


(do-snippets (:width (* S 2) :height (* S 2) :normalize nil)
  (cairo-set-matrix cr (cairo-matrix-init S 0 0 S S S))
  (let ((a 0))
    (dotimes (i L)
      (setf a (mod (+ a (/ (* 2 pi (fib i)) (fib (1+ i))))
                   (* 2 pi)))
      (let* ((r (/ i L))
             (x (* r (cos a)))
             (y (* r (sin a))))
        (cairo-set-source-rgb cr 0.4 0.4 0.9)
        (cairo-circle cr x y (/ (+ 0.05 r) 40))
        (cairo-fill cr)
        ))))
