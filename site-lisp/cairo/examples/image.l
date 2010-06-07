(load "_runner.l")
(do-snippets ()
  (with-cairo-surface (image (cairo-image-surface-create-from-png
                              (merge-pathnames "data/romedalen.png" snippet-directory)))
    (let ((w (cairo-image-surface-get-width image))
          (h (cairo-image-surface-get-height image)))
      (cairo-translate cr 0.5 0.5)
      (cairo-rotate cr (* 45 (/ pi 180)))
      (cairo-scale  cr (/ 1.0 w) (/ 1.0 h))
      (cairo-translate cr (* -0.5 w) (* -0.5 h))

      (cairo-set-source-surface cr image 0 0)
      (cairo-paint cr))))
