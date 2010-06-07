(load "_runner.l")

(defun draw-number-in-center (cr n xc yc)
  (cairo-new-path cr)
  (let* ((text (princ-to-string n))
         (extents (cairo-text-extents-alist cr text)))
    (flet (($ (key alist)
             (cdr (assoc key alist))))
      (cairo-move-to cr
                     (- xc (+ (/ ($ :width extents) 2)
                              ($ :x-bearing extents)))
                     (- yc (+ (/ ($ :height extents) 2)
                              ($ :y-bearing extents)))))
    (cairo-show-text cr text)))

(do-snippets ()
  (let* ((radius 0.15d0)         ; ”¼Œa
         (diameter (* 2 radius)) ; ’¼Œa
         (n 3))
    (cairo-select-font-face cr "Sans" :normal :normal)
    (cairo-set-font-size cr 0.05)
    (cairo-set-line-width cr 0.005)
    (dotimes (y (floor (/ 1 diameter)))     ; ‘½ŠpŒ`‚ð”z’u‚Å‚«‚é‚¾‚¯
      (dotimes (x (floor (/ 1 diameter)))   ; ”z’u‚·‚é
        (let ((xc (+ (* x diameter) radius))
              (yc (+ (* y diameter) radius)))
          (with-cairo-stroke (cr)
            (cairo-regular-polygon cr n xc yc (- radius 0.01)))
          (draw-number-in-center cr n xc yc)
          (incf n))))))
