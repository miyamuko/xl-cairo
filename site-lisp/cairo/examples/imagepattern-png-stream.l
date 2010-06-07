;;;;
;;;; imagepattern-png-stream.l - imagepattern.l ‚Ì Stream API ”Å
;;;;

(load "_runner.l")

(do-snippets0 ()
  (with-cairo-surface (surface (cairo-image-surface-create :argb32 width height))
    (with-cairo (cr (cairo-create surface))
      (with-open-file (out output-filename
                           :direction :output
                           :if-exists :supersede
                           :if-does-not-exist :create)
        (with-output-to-png (surface out)
          (snippet-normalize cr width height)
          (with-open-file (in (merge-pathnames "data/romedalen.png" snippet-directory)
                              :direction :input)
            (with-cairo-surface (image (cairo-image-surface-create-from-png in))
              (let* ((w (cairo-image-surface-get-width image))
                     (h (cairo-image-surface-get-height image)))
                (with-cairo-pattern (pattern (cairo-pattern-create-for-surface image))
                  (with-cairo-fill (cr)
                    (cairo-pattern-set-extend pattern :repeat)
                    (cairo-translate cr 0.5 0.5)
                    (cairo-rotate cr (/ pi 4))
                    (cairo-scale cr (/ 1 (sqrt 2)) (/ 1 (sqrt 2)))
                    (cairo-translate cr -0.5 -0.5)
                    (let ((matrix (cairo-matrix-init-scale (* w 5) (* h 5))))
                      (cairo-pattern-set-matrix pattern matrix)
                      (cairo-set-source cr pattern)
                      (cairo-rectangle cr 0 0 1.0 1.0))))))))))))
