(require "cairo")
(use-package :cairo)
(use-package :cairo.ext)

(defvar *snippet-filename-regexp*
  '("examples/.+\\.l$"))

(defun snippet-p (filename)
  (some #'(lambda (re)
            (string-matchp re filename))
        *snippet-filename-regexp*))

(defun snippet-filename ()
  (or (and (boundp '*snippet*)                 ; run-all-snippets
           *snippet*)
      (and (snippet-p *load-pathname*)         ; load-file
           *load-pathname*)
      (and (snippet-p (get-buffer-file-name))  ; eval-buffer
           (get-buffer-file-name))
      (plain-error "unknown snippet filename.")))

(defun snippet-directory (snippet)
  (directory-namestring snippet))

(defun output-filename (snippet &optional (ext ".png"))
  (substitute-string snippet "\\(\\.l$\\)?$" ext))

(defun snippet-normalize (cr width height)
  (cairo-scale cr width height)
  (cairo-set-line-width cr 0.04))

(defmacro do-snippets0 ((&key (height 256)
                              (width 256)
                              (ext ".png"))
                        &body body)
  `(let* ((snippet-filename (snippet-filename))
          (snippet-directory (snippet-directory snippet-filename))
          (output-filename (output-filename snippet-filename ,ext)))
     (let* ((height ,height)
            (width ,width))
       ,@body)))
(setf (get 'do-snippets0 'ed::lisp-indent-hook) 'with-output-to-string)

(defmacro do-snippets ((&key (height 256)
                             (width 256)
                             (ext ".png")
                             (normalize t))
                       &body body)
  (let ((start (gensym))
        (elapsed (gensym)))
    `(do-snippets0 (:height ,height :width ,width :ext ,ext)
       (delete-file output-filename :if-does-not-exist :skip :if-access-denied :skip)
       (let ((,start (get-internal-real-time)))
         (with-cairo-surface (surface (cairo-image-surface-create :argb32 width (+ height 15)))
           (with-cairo (cr (cairo-create surface))
             (with-output-to-png (surface output-filename)
               (with-cairo-save (cr)
                 (when ,normalize
                   (snippet-normalize cr width height))
                 (with-cairo-save (cr)
                   (cairo-set-source-rgb cr 1 1 1)
                   (cairo-paint cr))
                 (progn ,@body))
               ;; Elapsed Time
               (let ((,elapsed (- (get-internal-real-time) ,start)))
                 (with-cairo-save (cr)
                   (cairo-set-source-rgba cr 0 0 0 0.8)
                   (cairo-set-font-size cr 10)
                   (cairo-move-to cr 3 (+ ,height 10))
                   (cairo-show-text cr (format nil "Elapsed: ~,2F"
                                               (/ ,elapsed 1000.0))))))))))))
(setf (get 'do-snippets 'ed::lisp-indent-hook) 'with-output-to-string)


(defun scan-snippets-file (dir)
  (remove-if #'(lambda (l)
                 (string-matchp "^_" l))
             (directory dir :wild "*.l" :file-only t :absolute t)))

(defun clean-all-snippet-outputs (dir)
  (interactive "DSnippet Directory: " :default0 (default-directory))
  (dolist (snippet (scan-snippets-file dir))
    (dolist (out (directory dir :wild (format nil "~A.*" (pathname-name snippet))
                            :absolute t :fileonly t))
      (unless (string= (pathname-type out) "l")
        (delete-file out
                     :if-does-not-exist :skip
                     :if-access-denied :skip)))))

(defun run-all-snippets (dir)
  (interactive "DSnippet Directory: " :default0 (default-directory))
  (dolist (snippet (scan-snippets-file dir))
    (message snippet)
    (let ((*snippet* snippet))
      (declare (special *snippet*))
      (handler-case
          (load snippet)
        (error (c)
          (msgbox "Error: ~S" c))))))

(defun run-current-snippet-and-view ()
  (interactive)
  (eval-buffer (selected-buffer))
  (shell-execute (output-filename (get-buffer-file-name))))
