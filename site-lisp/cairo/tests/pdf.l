;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(setf *pdf-surface* (cairo-pdf-surface-create
                     (merge-pathnames "test.pdf")
                     100 100))

(setf *context* (cairo-create *pdf-surface*))
#S(cairo::context ptr 154743728 destroyed nil)

(require :cairo)
(use-package :cairo)
(use-package :cairo.ext)

(defun hello-pdf (width height text n)
  (flet ((calc-font-size (cr x text)
           (with-cairo-save (cr)
             (cairo-set-font-size cr 100.0)
             (* 100.0 (/ x (cdr (assoc :width (cairo-text-extents-alist cr text))))))))
    (with-cairo-surface (surface (cairo-pdf-surface-create
                                  (desktop "hello.pdf")
                                  width height))
      (with-cairo (cr (cairo-create surface))
        (cairo-set-source-rgb cr 0 0 0) ; black
        (cairo-set-font-size cr (calc-font-size cr width text))
        (cairo-move-to cr 0 (/ height 2))
        (cairo-show-text cr text)
        (dotimes (i (1- n))
          (cairo-surface-copy-page surface))
        ))))

(hello-pdf 291 210 "Hello, world!" 10)

(cairo-set-font-size *context* 10)
nil
(cairo-move-to 
(cairo-show-text *context* "hello")
nil

(cairo-copy-page *context*)
nil
(cairo-show-page *context*)
nil
(cairo-fill *context*)

(cairo-destroy *context*)
nil
nil

(cairo-surface-destroy *pdf-surface*)
nil
nil

(gc)
nil
