;; --*- mode: lisp-interaction; package: user -*--

(load "_loader.l")

(with-cairo-surface (surface (cairo-image-surface-create :argb32 100 100))
  (with-cairo (cr (cairo-create surface))
    (with-cairo-pattern (pattern (cairo-pattern-create-linear 0 0 1 1))
      (msgbox "~S" (list surface cr pattern)))))

(let (g)
  (with-cairo-font-face (face (cairo-win32-font-face-create "‚Ý‚©‚¿‚á‚ñ"))
    (setf g face)
    (msgbox "~S" face))
  g)

(let (g)
  (with-cairo-font-options (opt (cairo-font-options-create))
    (setf g opt)
    (msgbox "~S" opt))
  g)

(let (g)
  (with-cairo-scaled-font (opt (cairo-scaled-font-create
                                (cairo-win32-font-face-create "‚Ý‚©‚¿‚á‚ñ")
                                (cairo-matrix-init-identity)
                                (cairo-matrix-init-identity)
                                (cairo-font-options-create)))
    (setf g opt)
    (msgbox "~S" opt))
  g)


(setf *cr* (cairo-create *surface*))
#S(cairo::context ptr 149095048 destroyed nil)
