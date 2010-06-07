;;;;
;;;; text-on-path.l - �p�X��Ƀe�L�X�g��z�u����T���v��
;;;;
;;;; rcairo �� sample �̈ڐA�B
;;;; http://webcvs.cairographics.org/rcairo/samples/text-on-path.rb?view=markup
;;;;

(load "_runner.l")

(do-snippets (:normalize nil :width 500 :height 500)
  (let ((text "It was a dream... Oh Just a dream..."))
    ;; �Ȑ���`��
    (with-cairo-stroke-preserve (cr)
      (cairo-move-to cr 25 350)
      (cairo-line-to cr 150 375)
      (cairo-curve-to cr 275 400 450 350 450 200)
      (cairo-curve-to cr 450 0 300 150 50 50))
    ;; �Ȑ��̃p�X��ۑ�
    (let ((path (cairo-path-list-flat cr)))
      ;; �p�X���N���A
      (cairo-new-path cr)
      ;; �e�L�X�g�̃p�X���쐬
      (cairo-set-line-width cr 1)
      (cairo-select-font-face cr "Serif" :normal :normal)
      (cairo-set-font-size cr 36)
      (cairo-text-path cr text)
      ;; ���݂� context ��̃p�X (= �e�L�X�g�̃p�X) �� path ��ɕϊ�����
      (cairo-map-path-onto cr path)
      ;; �e�L�X�g��`��
      (cairo-set-source-rgba cr 0.3 0.3 1.0 0.3)
      (cairo-fill-preserve cr)
      (cairo-set-source-rgb cr 0.1 0.1 0.1)
      (cairo-stroke cr))))