(load "_runner.l")

(do-snippets ()
  (cairo-triangle cr
                  0.1 0.1
                  0.7 0.6
                  0.2 0.9)
  (with-cairo-fill-preserve (cr)
    (cairo-set-source-rgba cr 1 0 0 0.5))
  (with-cairo-stroke (cr)
    (cairo-set-source-rgb cr 1 0 0)))
