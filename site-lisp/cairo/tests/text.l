;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")
(cairo.ffi:cairo-unload-dll)

(setf *surface* (cairo-image-surface-create CAIRO_FORMAT_ARGB32 100 100))
#S(cairo::surface ptr 44328880 destroyed nil)

(setf *cr* (cairo-create *surface*))
#S(cairo::context ptr 149097616 destroyed nil)

(cairo-select-font-face *cr* "メイリオ" :normal :normal)
nil
(cairo-select-font-face *cr* "みかちゃん" :normal :normal)
nil

(cairo-set-font-size *cr* 50)
nil

(cairo-set-font-matrix *cr* (cairo-matrix-init 2 3 4 5 6 7))

(matrix-to-alist (cairo-get-font-matrix *cr*))

(setf *opts* (cairo-font-options-create))
#S(cairo::font-options ptr 44319152 destroyed nil)
(cairo-set-font-options *cr* *opts*)
nil

(cairo-get-font-options *cr*)

(setf (cairo-get-font-options *cr*) *opts*)


(setf *face* (cairo-win32-font-face-create-for-logfontw (create-logfontw "メイリオ")))
#S(cairo::font-face ptr 44315856 destroyed nil)
(cairo-font-face-get-reference-count *face*)
1
(cairo-set-font-face *cr* *face*)
nil
(setf *face2* (cairo-get-font-face *cr*))
(cairo-font-face-get-reference-count *face*)

(cairo-set-scaled-font *cr* (cairo-scaled-font-create
                             (cairo-win32-font-face-create-for-logfontw (create-logfontw))
                             (cairo-matrix-init-identity)
                             (cairo-matrix-init-identity)
                             (cairo-font-options-create)))
nil

(cairo-get-scaled-font *cr*)
#S(cairo::scaled-font ptr 266048048 destroyed nil)

(cairo-move-to *cr* 1 50)
nil
(cairo-set-source-rgb *cr* 0.0 0.0 1.0)
nil
(cairo-show-text *cr* "あいう")
nil
(cairo-fill *cr*)
nil

(cairo-glyph-extents *cr* (make-glyph :index 48 :x 10 :y 10))

(cairo-glyph-extents *cr* (list (make-glyph :index 48 :x 10 :y 10)
                                (make-glyph :index 49 :x 20 :y 10)
                                (make-glyph :index 50 :x 30 :y 10)))

(cairo-font-extents *cr*)
(cairo-font-extents-alist *cr*)
(cairo-font-extents-list *cr*)

(cairo-text-extents *cr* "ab")
(cairo-text-extents-list *cr* "ab")
(cairo-text-extents-alist *cr* "ab")
(cairo-clip-rectangle-list *cr*)


(cairo-show-glyphs *cr* (list (make-glyph :index 48 :x 10 :y 10)
                              (make-glyph :index 49 :x 10 :y 10)
                              (make-glyph :index 50 :x 10 :y 10)))

(cairo-glyph-extents *cr* (list (make-glyph :index 48 :x 10 :y 10)
                                (make-glyph :index 49 :x 20 :y 10)
                                (make-glyph :index 50 :x 30 :y 10)))
(cairo-glyph-extents-alist *cr* (list (make-glyph :index 48 :x 10 :y 10)
                                      (make-glyph :index 49 :x 20 :y 10)
                                      (make-glyph :index 50 :x 30 :y 10)))
(cairo-glyph-extents *cr* (make-glyph :index 48 :x 10 :y 10))
(cairo-glyph-extents-alist *cr* (make-glyph :index 48 :x 10 :y 10))
(cairo-glyph-extents-list *cr* (make-glyph :index 48 :x 10 :y 10))


(setf ext (cairo-text-extents *cr* "あいうえお"))
(text-extents-to-alist ext)

(cairo-surface-write-to-png *surface* (desktop "showtext.png"))
nil

(cairo-surface-destroy *surface*)
nil
(cairo-destroy *cr*)
nil



(let* ((surface (cairo-image-surface-create CAIRO_FORMAT_ARGB32 300 200))
       (cr (cairo-create surface)))

  (cairo-set-font-size cr 50)
  (cairo-move-to cr 0 50)
  (cairo-set-source-rgb cr 0.0 0.0 1.0)

  (cairo-show-glyphs cr (list (make-glyph :index 21 :x 00 :y 50)
                              (make-glyph :index 48 :x 50 :y 50)
                              (make-glyph :index 48 :x 100 :y 50)))
;  (cairo-show-text cr "abc☆あいう")

  (cairo-set-font-face cr (cairo-win32-font-face-create "メイリオ"))
  (cairo-move-to cr 0 100)
  (cairo-set-source-rgb cr 1.0 0.0 0.0)
  (cairo-show-text cr "abc☆あいう")

  (cairo-set-font-face cr (cairo-win32-font-face-create "あずきフォント"))
  (cairo-move-to cr 0 150)
  (cairo-set-source-rgb cr 0.0 1.0 0.0)
  (cairo-show-text cr "abc☆あいう")
  (cairo-surface-write-to-png surface (desktop "showtext.png"))
  (cairo-surface-destroy surface)
  (cairo-destroy cr))


(with-cairo-font-face (face (cairo-toy-font-face-create "みかちゃん" :italic :bold)
                            )
  (values
   (cairo-toy-font-face-get-family face)
   (cairo-toy-font-face-get-slant face)
   (cairo-toy-font-face-get-weight face)
   ))

(with-cairo-surface (surface (cairo-pdf-surface-create (desktop "showtext.pdf") 100 100))
  (with-cairo (cr (cairo-create surface))
    (unless (cairo-surface-has-show-text-glyphs surface)
      (plain-error "surface は show-text-glyphs をサポートしていません"))
    (cairo-set-font-size cr 100)
    (cairo-move-to cr 0 100)
    (cairo-set-source-rgb cr 0 0 0) ; black
    (with-cairo-font-face (face (cairo-win32-font-face-create "メイリオ"))
      (with-cairo-font-options (opts (cairo-font-options-create))
        (with-cairo-scaled-font (scaled-font (cairo-scaled-font-create
                                              face
                                              (cairo-matrix-init-identity)
                                              (cairo-matrix-init-identity)
                                              opts))
          (cairo-set-scaled-font cr scaled-font)
          (multiple-value-bind (glyphs clusters cluster-flags)
              (cairo-scaled-font-text-to-glyphs scaled-font 5 5 "abcdefgh")
            (cairo-show-text-glyphs cr "abcdefgh" glyphs clusters cluster-flags)
;            (cairo-show-glyphs cr glyphs)
            ))))))
