(load "_runner.l")

(defun select-win32-font (cr face bold)
  (with-cairo-font-face (face (cairo-win32-font-face-create face :bold bold))
    (cairo-set-font-face cr face)))

(do-snippets (:width 800
              :height 300
              :normalize nil)
  (let* ((pi2 (* pi 2.0d0))
         (star-size 200)
         (star-size/2 (/ star-size 2))
         (height/2 (/ height 2))
         (width/2 (/ width 2))
         (margin 40)
         (red (mapcar #'(lambda (hex) (/ hex 256.0d0)) '(226 10 22))))
    (with-cairo-fill (cr)
      (cairo-set-source-rgb cr 1 1 1) ; white
      (cairo-paint cr)

      (cairo-set-line-width cr 4)

    ;; draw margin
      (apply #'cairo-set-source-rgb cr red)
      (cairo-rectangle cr 0 0 width margin)
      (cairo-rectangle cr 0 (- height margin) width height))

    ;; draw star
    (with-cairo-save (cr) ;; save current transform matrix
      (select-win32-font cr "MS UI ゴシック" t)
      (cairo-translate cr (- width star-size) (/ (- height star-size) 2))
      (let* ((xc (/ star-size 2))
             (yc xc))
        (with-cairo-fill (cr)
          (apply #'cairo-set-source-rgb cr red) ; red
          (dolist (i '(1 3 5 2 4))
            (let ((angle (- (* pi2 (/ i 5.0d0))
                            (* 90 (/ pi 180)))))
              (cairo-arc cr xc yc (- (/ star-size 2) 0) angle angle)))
          (cairo-close-path cr))
        ;; draw name
        (cairo-set-font-size cr 30)
        (cairo-set-source-rgb cr 1 1 1) ; white
        (let* ((text "Lisp")
               (extents (cairo-text-extents-alist cr text)))
          (flet (($ (key alist)
                   (cdr (assoc key alist))))
            (cairo-move-to cr
                           (- xc (+ (/ ($ :width extents) 2)
                                    ($ :x-bearing extents)))
                           (- yc (+ (/ ($ :height extents) 2)
                                    ($ :y-bearing extents))
                              10)))
          (cairo-show-text cr text))

        ;; draw version
        (cairo-set-font-size cr 40)
        (cairo-move-to cr (- xc 25) (+ yc 30))
        (cairo-show-text cr "2")
        (cairo-move-to cr (+ xc 5) (+ yc 30))
        (cairo-show-text cr "0")

        (cairo-set-source-rgb cr 1 1 0) ; yellow
        (cairo-set-font-size cr 8)
        (cairo-move-to cr (- xc 4) (+ yc 30))
        (cairo-show-text cr "★")))

    ;; draw message
    (with-cairo-save (cr)
      (cairo-translate cr 0 margin)
      (apply #'cairo-set-source-rgb cr red)
      (cairo-set-font-size cr 60)

      (select-win32-font cr "MS UI ゴシック" nil)
      (cairo-move-to cr margin (+ 10 (- height/2 60 10)))
      (cairo-show-text cr "★さて、そろそろ")
      (cairo-move-to cr margin (+ 10 (+ height/2 0)))
      (cairo-show-text cr "applyしてもいいですか?"))
    ))
