;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")
t


(setf *surface* (cairo-image-surface-create :argb32 100 100))

(setf *cr* (cairo-create *surface*))

(cairo-move-to *cr* 0 5)
nil

(cairo-line-to *cr* 0 10)
nil

(cairo-line-to *cr* 10 10)
nil

(cairo-close-path *cr*)
nil
nil

(cairo-move-to *cr* 1 50)
(cairo-has-current-point *cr*)

(cairo-path-extents *cr*)
(cairo-path-extents-list *cr*)
(cairo-path-extents-alist *cr*)


(setf *path* (cairo-copy-path *cr*))
#S(cairo::path ptr 44390144 destroyed nil)

(cairo-path-list *cr*)
((:move-to (0.0 0.0)) (:line-to (0.0 10.0)) (:line-to (10.0 10.0)) (:close-path) (:move-to (0.0 0.0)) (:line-to (0.0 10.0)) (:line-to (10.0 10.0)) (:close-path) (:move-to (0.0 0.0)))

(cairo-copy-path-flat *cr*)
#S(cairo::path ptr 44319152 destroyed nil)

(cairo-path-destroy *path*)

(cairo-append-path *cr* *path*)
(cairo-get-current-point *cr*)

(cairo-new-path *cr*)

(cairo-new-sub-path *cr*)
(cairo-close-path *cr*)
(cairo-arc *cr* 1 2 3 4 5)
nil
(cairo-arc-negative *cr* 1 2 3 4 5)
nil
(cairo-curve-to *cr* 0 0 10 0 0 10)
nil
(cairo-line-to *cr* 20 20)
nil
(cairo-move-to *cr* 1 1)
(cairo-rectangle *cr* 10 10 20 20)
(cairo-glyph-path *cr* (list (make-glyph :index 42 :x 10 :y 10)))
(cairo-text-path *cr* "A")
(cairo-rel-curve-to *cr* 1 1 2 2 3 3)
(cairo-rel-line-to *cr* 3 3)
(cairo-rel-move-to *cr* 4 4)


(with-cairo-surface (surface (cairo-image-surface-create :argb32 1000 1000))
  (with-cairo (cr (cairo-create surface))
    (cairo-move-to cr 25 350)
    (cairo-line-to cr 150 375)
    (cairo-curve-to cr 275 400 450 350 450 200)
    (cairo-curve-to cr 450 0 300 150 50 50)
    (cairo-stroke-preserve cr)
    (cairo.ext::parameterize-path (cairo-path-list cr))))


(with-cairo-surface (surface (cairo-image-surface-create :argb32 1000 1000))
  (let ((st (get-internal-real-time)))
    (with-cairo (cr (cairo-create surface))
      (cairo-move-to cr 25 350)
      (cairo-line-to cr 150 375)
      (cairo-curve-to cr 275 400 450 350 450 200)
      (cairo-curve-to cr 450 0 300 150 50 50)
      (cairo-stroke-preserve cr)
      (let ((path (cairo-path-list-flat cr)))
        (cairo-set-line-width cr 1)
        (cairo-new-path cr)
        (cairo-select-font-face cr "Serif" :normal :normal)
        (cairo-set-font-size cr 36)
        (cairo-text-path cr "It was a dream... Oh Just a dream...")
        (let ((p (cairo.ext::map-path-onto cr path)))
          (cairo-new-sub-path cr)
          (dolist (t/pt p)
            (case (car t/pt)
              (:move-to
               (apply 'cairo-move-to cr (nth 0 (cdr t/pt))))
              (:line-to
               (apply 'cairo-line-to cr (nth 0 (cdr t/pt))))
              (:curve-to
               (cairo-curve-to cr
                               (car (nth 0 (cdr t/pt))) (cadr (nth 0 (cdr t/pt)))
                               (car (nth 1 (cdr t/pt))) (cadr (nth 1 (cdr t/pt)))
                               (car (nth 2 (cdr t/pt))) (cadr (nth 2 (cdr t/pt)))))
              (:close-path
               (cairo-close-path cr)))))
        (cairo-set-source-rgb cr 1 1 1)
        (cairo-fill-preserve cr)
        (cairo-set-source-rgb cr 1 0 0)
        (cairo-stroke cr)
        (cairo-surface-write-to-png surface (desktop "foo.png"))
        ))
    (- (get-internal-real-time) st)))

(with-cairo-surface (surface (cairo-image-surface-create :argb32 500 500))
  (let ((st (get-internal-real-time)))
    (with-cairo (cr (cairo-create surface))
      (cairo-move-to cr 25 350)
      (cairo-line-to cr 150 375)
      (cairo-curve-to cr 275 400 450 350 450 200)
      (cairo-curve-to cr 450 0 300 150 50 50)
      (cairo-stroke-preserve cr)
      (let ((path (cairo-path-list-flat cr)))
        (cairo-new-path cr)
        (cairo-set-line-width cr 1)
        (cairo-select-font-face cr "Serif" :normal :normal)
        (cairo-set-font-size cr 36)
        (cairo-text-path cr "It was a dream... Oh Just a dream...")
        (cairo.ext::map-path-onto cr path)
        (cairo-set-source-rgb cr 1 1 1)
        (cairo-fill-preserve cr)
        (cairo-set-source-rgb cr 1 0 0)
        (cairo-stroke cr)
        (cairo-surface-write-to-png surface (desktop "foo.png"))))
    (- (get-internal-real-time) st)))

(with-cairo-surface (surface (cairo-image-surface-create :argb32 500 500))
  (with-cairo (cr (cairo-create surface))
    (cairo-move-to cr 0 0)
    (cairo-line-to cr 10 15)
    (cairo-stroke-preserve cr)
    (let ((path (cairo-path-list-flat cr)))
      (cairo-set-line-width cr 1)
      (cairo-new-path cr)
      (cairo-select-font-face cr "Serif" :normal :normal)
      (cairo-set-font-size cr 36)
      (cairo-text-path cr "abc")
      (cairo.ext::map-path-onto cr path))))


(with-cairo-surface (surface (cairo-image-surface-create :argb32 1000 1000))
  (with-cairo (cr (cairo-create surface))
    (cairo-move-to cr 25 350)
    (cairo-line-to cr 150 375)
    (cairo-curve-to cr 275 400 450 350 450 200)
    (cairo-curve-to cr 450 0 300 150 50 50)
    (cairo-close-path cr)
    (cairo-set-line-width cr 1)
    (cairo-set-source-rgb cr 1 0 0)
    (cairo-stroke-preserve cr)
    (with-cairo-path (path (cairo-copy-path cr))
      (cairo-scale cr 1/2 1/2)
      (cairo-append-path cr path))
    (let ((path (cairo-path-list cr)))
      (cairo-scale cr 1/2 1/2)
      (cairo-append-path cr path))
    (cairo-stroke cr)
    (cairo-surface-write-to-png surface (desktop "foo.png"))))

