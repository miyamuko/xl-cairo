;; modules ���� require ���������폜
(setf *modules* (remove-if #'(lambda (m)
                               (string-match "^cairo" m))
                           *modules*))

;; �p�b�P�[�W���ƍ폜
(dolist (pkgname '(:cairo.util :cairo.ffi :cairo :cairo.ext))
  (when (find-package pkgname)
    (dolist (usedby (package-used-by-list pkgname))
      (unuse-package pkgname usedby))
    (delete-package pkgname)))
(gc)

;; �ă��[�h
(require "cairo")

;; use-package ����O�ɓ����̃V���{�����폜
(dolist (pkgname '(:cairo :cairo.ext))
  (do-external-symbols (sym pkgname)
    (unintern (intern (string sym))))
  (use-package pkgname))


(defun desktop (filename)
  (merge-pathnames filename (get-special-folder-location :desktop)))

(defmacro with-output-png ((cairo filename) &body body)
  `(let* ((surface (cairo-image-surface-create 0 200 200))
          (,cairo (cairo-create surface)))
     (progn ,@body)
     (cairo-surface-write-to-png surface ,filename)))
(setf (get 'with-output-png 'lisp-indent-hook) 0)