(load "_runner.l")
(do-snippets ()
  (cairo-set-line-width cr 0.12)
  (cairo-set-line-cap  cr :butt) ;; default
  (cairo-move-to cr 0.25 0.2) (cairo-line-to cr 0.25 0.8)
  (cairo-stroke cr)
  (cairo-set-line-cap  cr :round)
  (cairo-move-to cr 0.5 0.2) (cairo-line-to cr 0.5 0.8)
  (cairo-stroke cr)
  (cairo-set-line-cap  cr :square)
  (cairo-move-to cr 0.75 0.2) (cairo-line-to cr 0.75 0.8)
  (cairo-stroke cr)

  ;; draw helping lines
  (cairo-set-source-rgb cr 1 0.2 0.2)
  (cairo-set-line-width cr 0.01)
  (cairo-move-to cr 0.25 0.2) (cairo-line-to cr 0.25 0.8)
  (cairo-move-to cr 0.5 0.2)  (cairo-line-to cr 0.5 0.8)
  (cairo-move-to cr 0.75 0.2) (cairo-line-to cr 0.75 0.8)
  (cairo-stroke cr))
