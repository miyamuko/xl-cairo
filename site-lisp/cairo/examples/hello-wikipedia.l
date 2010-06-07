;; http://commons.wikimedia.org/wiki/File:Cairo_example.svg �̈ڐA

(load "_runner.l")

(do-snippets (:width 100 :height 100 :normalize nil)
  ;; Quadrate im Hintergrund zeichnen
  (dotimes (x 10)
    (dotimes (y 10)
      (cairo-rectangle cr (* x 10.0) (* y 10.0) 5 5)))

  (with-cairo-pattern (pattern (cairo-pattern-create-radial 50 50 5 50 50 50))
    (cairo-pattern-add-color-stop-rgb pattern 0 0.75 0.15 0.99)
    (cairo-pattern-add-color-stop-rgb pattern 0.9 1 1 1)

    (cairo-set-source cr pattern)
    (cairo-fill cr))

  ;; Schrift im Vordergrund
  (cairo-set-font-size cr 15)
  (cairo-select-font-face cr "Georgia" :normal :bold)
  (cairo-set-source-rgb cr 0 0 0)

  (cairo-move-to cr 10 25)
  (cairo-show-text cr "Hello")

  (cairo-move-to cr 10 75)
  (cairo-show-text cr "Wikipedia!")
  )
