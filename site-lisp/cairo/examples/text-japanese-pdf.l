;;;;
;;;; text-japanese-pdf.l - text-japanese.l �� PDF ��
;;;;


(load "_runner.l")

(do-snippets0 (:ext ".pdf")
  (with-cairo-surface (surface (cairo-pdf-surface-create output-filename 200 200))
    (with-cairo (cr (cairo-create surface))
      (snippet-normalize cr width height)
      (with-cairo-font-face (face (cairo-win32-font-face-create "�l�r �S�V�b�N"))
        (cairo-set-font-face cr face))
      (cairo-set-font-size cr 0.2)
      (cairo-move-to cr 0.04 0.53)
      (cairo-show-text cr "�͂�`")

      (cairo-move-to cr 0.27 0.65)
      (cairo-text-path cr "�{�C�h")
      (cairo-set-source-rgb cr 0.5 0.5 1)
      (cairo-fill-preserve cr)
      (cairo-set-source-rgb cr 0 0 0)
      (cairo-set-line-width cr 0.01)
      (cairo-stroke cr)

      ;; draw helping lines
      (cairo-set-source-rgba cr 1 0.2 0.2 0.6)
      (cairo-arc cr 0.04 0.53 0.02 0 (* 2 pi))
      (cairo-arc cr 0.27 0.65 0.02 0 (* 2 pi))
      (cairo-fill cr))))
