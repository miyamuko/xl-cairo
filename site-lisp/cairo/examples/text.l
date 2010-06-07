(load "_runner.l")
(do-snippets ()
  (cairo-select-font-face cr "Sans"
                          CAIRO_FONT_SLANT_NORMAL
                          CAIRO_FONT_WEIGHT_BOLD)
  (cairo-set-font-size cr 0.35)
  (cairo-move-to cr 0.04 0.53)
  (cairo-show-text cr "Hello")

  (cairo-move-to cr 0.27 0.65)
  (cairo-text-path cr "void")
  (cairo-set-source-rgb cr 0.5 0.5 1)
  (cairo-fill-preserve cr)
  (cairo-set-source-rgb cr 0 0 0)
  (cairo-set-line-width cr 0.01)
  (cairo-stroke cr)

  ;; draw helping lines
  (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
  (cairo-arc cr 0.04 0.53 0.02 0 (* 2 pi))
  (cairo-arc cr 0.27 0.65 0.02 0 (* 2 pi))
  (cairo-fill cr))
