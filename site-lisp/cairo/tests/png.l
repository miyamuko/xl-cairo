;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *png-surface* (cairo-image-surface-create-from-png
                     (merge-pathnames "../src/cairo-1.4.6/test/bitmap-font-rgb24-ref.png" (default-directory))))

(setf *context* (cairo-create *png-surface*))

(cairo-surface-get-type *png-surface*)
:image

(cairo-surface-status *png-surface*)
raise-cairo-file-not-found-error

(cairo-surface-flush *png-surface*)
nil

(cairo-surface-destroy *png-surface*)
(cairo-surface-write-to-png *png-surface* (desktop "foo.png"))

(cairo-destroy *context*)

(cairo-surface-get-reference-count *png-surface*)

(with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
  (cairo::cairo-surface-write-to-png-closure surface #'(lambda (data)
                                                        (msgbox "~S" data))))

;; image, stream
(with-open-file (out (desktop "foo.png")
                     :direction :output
                     :if-exists :supersede
                     :if-does-not-exist :create)
  (with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
    (with-output-to-png (surface out)
      (with-cairo (cr (cairo-create surface))
        (cairo-set-source-rgb cr 1 1 1)
        (cairo-paint cr)
        (cairo-rectangle cr 10 10 40 40)
        (cairo-set-source-rgba cr 1 0 0 0.5)
        (cairo-fill cr)))))

;; stream, file
(with-open-file (in (desktop "foo.png") :direction :input)
  (with-cairo-surface (surface (cairo-image-surface-create-from-png in))
    (with-output-to-png (surface (desktop "bar.png")))))

;; file, file
(with-cairo-surface (surface (cairo-image-surface-create-from-png (desktop "foo.png")))
  (with-output-to-png (surface (desktop "bar2.png"))))

;; stream, stream
(with-open-file (in (desktop "foo.png") :direction :input)
  (with-open-file (out (desktop "bar3.png")
                       :direction :output
                       :if-exists :supersede
                       :if-does-not-exist :create)
    (with-cairo-surface (surface (cairo-image-surface-create-from-png in))
      (with-output-to-png (surface out)))))
