(load "_runner.l")
(do-snippets ()
  (with-cairo-fill-preserve (cr)
    (cairo-move-to cr 0.5 0.1)
    (cairo-line-to cr 0.9 0.9)
    (cairo-rel-line-to cr -0.4 0.0)
    (cairo-curve-to cr 0.2 0.9 0.2 0.5 0.5 0.5)
    (cairo-close-path cr)

    (cairo-move-to cr 0.25 0.1)
    (cairo-rel-line-to cr 0.2 0.2)
    (cairo-rel-line-to cr -0.2 0.2)
    (cairo-rel-line-to cr -0.2 -0.2)
    (cairo-close-path cr)

    (cairo-set-source-rgb cr 0 0 1))

  (with-cairo-stroke (cr)
    (cairo-set-source-rgb cr 0 0 0)))
