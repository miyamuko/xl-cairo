;; modules から require した情報を削除
(setf *modules* (remove-if #'(lambda (m)
                               (string-match "^cairo" m))
                           *modules*))

;; パッケージごと削除
(dolist (pkgname '(:cairo.util :cairo.ffi :cairo :cairo.ext))
  (when (find-package pkgname)
    (dolist (usedby (package-used-by-list pkgname))
      (unuse-package pkgname usedby))
    (delete-package pkgname)))
(gc)

;; 再ロード
(require "cairo")

;; use-package する前に同名のシンボルを削除
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
