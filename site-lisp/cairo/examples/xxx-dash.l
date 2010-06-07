(load "_runner.l")
(do-snippets ()
  (let ((dashes (list 0.20  ;; ink
                      0.05  ;; skip
                      0.05  ;; ink
                      0.05   ;; skip
                      ))
        (offset -0.2))
    (cairo-set-dash cr dashes offset)
    (cairo-move-to cr 0.5 0.1)
    (cairo-line-to cr 0.9 0.9)
    (cairo-rel-line-to cr -0.4 0.0)
    (cairo-curve-to cr 0.2 0.9 0.2 0.5 0.5 0.5)
    (cairo-stroke cr)))
