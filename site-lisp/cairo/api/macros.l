;;;; -*- mode: lisp; package: cairo -*-
;;;;
;;;; File: cairo/api/macros.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007-2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/util/symbol")
  (require "cairo/util/struct")
  (require "cairo/util/c-struct")
  (require "cairo/ffi/util")
  (require "cairo/api/package")
  (require "cairo/api/conditions")
  )

(in-package :cairo)


;;;; autoboxing

(defun no-need-to-autoboxing (v)
  v)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro define-autoboxing-for ((&rest types) &key lisp->c c->lisp)
    `(progn
       ,@(mapcar #'(lambda (type)
                     `(progn
                        ,(when lisp->c
                           `(setf (get ',type 'cairo::lisp->c) ,lisp->c))
                        ,(when c->lisp
                           `(setf (get ',type 'cairo::c->lisp) ,c->lisp))))
                 types))))
(setf (get 'define-autoboxing-for 'ed:lisp-indent-hook) 'defstruct)

(defun c->lisp-converter (type)
  (or
   (get type 'cairo::c->lisp)
   (raise-cairo-internal-error (format nil "c->lisp: unsupported type `~S'" type))))

(defun lisp->c-converter (type)
  (or
   (get type 'cairo::lisp->c)
   (raise-cairo-internal-error (format nil "lisp->c: unsupported type `~S'" type))))

(defun returning-hook (type)
  (or
   (get type 'cairo::returning-hook)
   (c->lisp-converter type)))


(defmacro checking-status-using ((func &optional var) &body body)
  (let ((r (gensym)))
    `(,@(if var
            `(let ((,r ,var))
               (prog1
                   (progn ,@body)
                 (,func ,r)))
          `(let ((,r (progn ,@body)))
             (,func ,r)
             ,r)))))
(setf (get 'checking-status-using 'ed:lisp-indent-hook) 'with-output-to-string)

(defmacro returning ((type) &body body)
  `(progn
     ,@(if (eq (returning-hook type) 'no-need-to-autoboxing)
           body
         `((,(returning-hook type)
            (progn ,@body))))))
(setf (get 'returning 'ed:lisp-indent-hook) 'with-output-to-string)


(defmacro with-c-arguments ((&rest args-with-c-type) &body body)
  `(let (,@(mapcar #'(lambda (e)
                       `(,(cadr e) (,(lisp->c-converter (car e)) ,(cadr e))))
                   (remove-if #'(lambda (e)
                                  (eq (lisp->c-converter e) 'no-need-to-autoboxing))
                              args-with-c-type
                              :key #'car)))
     ,@body))
(setf (get 'with-c-arguments 'ed:lisp-indent-hook) 'with-output-to-string)

(defmacro with-c-out-values ((&rest binds) &body body)
  `(let (,@(mapcar #'(lambda (bind)
                       (let ((ctype (caar bind))
                             (cvar (cadar bind))
                             (init (cadr bind)))
                         `(,cvar (cairo.ffi:make-chunk-for ',ctype ,(or init 0)))))
                   binds))
     (progn ,@body)
     (values ,@(mapcar #'(lambda (bind)
                           (let ((ctype (caar bind))
                                 (cvar (cadar bind)))
                             `(returning (,ctype)
                                (cairo.ffi:unpack-chunk-for ',ctype ,cvar))))
                       binds))))
(setf (get 'with-c-out-values 'ed:lisp-indent-hook) 'with-output-to-string)


;;;; nullable context

(defconstant *cairo-nullable-context-p* (gensym))

(defmacro nullable (&body body)
  `(let ((,*cairo-nullable-context-p* t))
     (declare (special ,*cairo-nullable-context-p*))
     ,@body))
(setf (get 'nullable 'ed:lisp-indent-hook) 'with-output-to-string)

(defmacro nullable-context-p ()
  `(and (boundp ',*cairo-nullable-context-p*)
        *cairo-nullable-context-p*))

(defmacro null-or-returning ((type) &body body)
  `(nullable
     (returning (,type)
       ,@body)))
(setf (get 'null-or-returning 'ed:lisp-indent-hook) 'with-output-to-string)


;;;; with macro

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defmacro define-destroy-macro (macroname destructor)
    (let ((call-fn-name (symbol-join "call-" macroname)))
      `(progn
         (defun ,call-fn-name (func arg)
           (unwind-protect
               (funcall func arg)
             (,destructor arg)))
         (defmacro ,macroname ((var init) &body body)
           `(,',call-fn-name (lambda (,var) ,@body) ,init))
         (setf (get ',macroname 'ed:lisp-indent-hook) 'with-open-file)
         (export '(,macroname ,call-fn-name)))))

  (defmacro define-arround-macro1 (macroname &key before after protect)
    (let ((call-fn-name (symbol-join "call-" macroname)))
      `(progn
         (defun ,call-fn-name (func arg)
           ,(when before `(,before arg))
           (,(if protect 'unwind-protect 'progn)
            (funcall func arg)
            ,(when after `(,after arg))))
         (defmacro ,macroname ((var) &body body)
           (with-gensyms (gvar)
             `(let ((,gvar ,var))
                (,',call-fn-name (lambda (,gvar) ,@body) ,gvar))))
         (setf (get ',macroname 'ed:lisp-indent-hook) 'progn)
         (export '(,macroname ,call-fn-name)))))
  )


;;;; pointer to private c-struct wrapper

(defstruct c-private-struct-wrapper
  ptr destroyed)

(defun ensure-c-ptr-is-not-null (ptr)
  (when (nullp ptr)
    (raise-cairo-argument-error "null pointer!.")))

(defun ensure-c-ptr-is-not-destroyed (wrapper)
  (when (c-private-struct-wrapper-destroyed wrapper)
    (raise-cairo-argument-error "destroyed object passed!."))
  (ensure-c-ptr-is-not-null (c-private-struct-wrapper-ptr wrapper)))

(defun c-private-struct-reference-count (wrapper)
  (let ((refcount (get (structure-name wrapper) 'cairo::reference-count-fn)))
    (if refcount
        (funcall refcount wrapper)
      0)))

(defmacro define-c-private-struct-wrapper ((name c-struct &optional reference-count-fn) &rest rest)
  (let ((fcheck (symbol-join "check-" name))
        (fmake-from-ptr (symbol-join "make-" name "-from-ptr"))
        (fmake (symbol-join "make-" name))
        (fptr (symbol-join name "-ptr"))
        (fptr-with-check (symbol-join name "-ptr-with-check")))
    `(progn
       (eval-when (:compile-toplevel :load-toplevel :execute)
         (defstruct (,name
                     (:include c-private-struct-wrapper))
           ,@rest)

         (define-autoboxing-for (,c-struct)
           :c->lisp ',fmake-from-ptr
           :lisp->c ',fptr-with-check))

       (defun ,fcheck (arg)
         (check-type arg ,name))

       (defun ,fmake-from-ptr (ptr)
         (if (and (nullp ptr)
                  (nullable-context-p))
             nil
           (progn
             (ensure-c-ptr-is-not-null ptr)
             (,fmake :ptr ptr))))

       (defun ,fptr-with-check (wrapper)
         (,fcheck wrapper)
         (ensure-c-ptr-is-not-destroyed wrapper)
         (,fptr wrapper))

       (setf (get ',name 'cairo::reference-count-fn) ',reference-count-fn)
       )))
(setf (get 'define-c-private-struct-wrapper 'ed:lisp-indent-hook) 'defstruct)

(defmacro with-destroy-c-ptr ((var) &body body)
  (let ((count (gensym)))
    `(let ((,count (c-private-struct-reference-count ,var)))
       (unwind-protect
           (unless (zerop ,count)
             (progn ,@body)
             (decf ,count))
         (when (zerop ,count)
           (setf (c-private-struct-wrapper-ptr ,var) 0
                 (c-private-struct-wrapper-destroyed ,var) t))))))
(setf (get 'with-destroy-c-ptr 'ed:lisp-indent-hook) 'with-output-to-string)


;;;; c-struct wrapper

(defstruct c-struct-wrapper
  )

(defmacro define-c-struct-wrapper ((name c-struct))
  (let ((ftoalist (symbol-join name "-to-alist"))
        (ftolist (symbol-join name "-to-list"))
        (fvalues (symbol-join name "-values"))
        (fcheck (symbol-join "check-" name))
        (fmake-from-chunk (symbol-join "make-" name "-from-chunk"))
        (fmake-from-ptr (symbol-join "make-" name "-from-ptr"))
        (fnew-chunk-with-check (symbol-join name "-new-chunk-with-check"))
        (fmake (symbol-join "make-" name))
        (fchunk (symbol-join name "-chunk"))
        (fmake-c-struct (symbol-join "make-" c-struct))
        (fsync-l2c (symbol-join name "-sync-lisp->c"))
        (fsync-c2l (symbol-join name "-sync-c->lisp"))
        (lisp/c-accessors (mapcar #'(lambda (slot)
                                      (list slot
                                            (get (symbol-join-to 'cairo.ffi c-struct "-" slot)
                                                 'cairo.ffi::c-struct-type)
                                            (symbol-join name "-" slot)
                                            (symbol-join c-struct "-" slot)))
                                  (c-struct-slot-names c-struct))))
    `(progn
       (eval-when (:compile-toplevel :load-toplevel :execute)
         (defstruct (,name
                     (:include c-struct-wrapper))
           (chunk (,fmake-c-struct))
           ,@(mapcar #'(lambda (slot)
                         `(,slot 0))
                     (c-struct-slot-names c-struct)))

         (define-autoboxing-for (,c-struct)
           :c->lisp nil   ;; \‘¢‘Ì‚Ì allocate ‚Í caller ‚ª‚·‚é‚Ì‚Å•s—v
           :lisp->c ',fnew-chunk-with-check)

         (define-autoboxing-for (,(symbol-join c-struct #\*))
           :c->lisp ',fmake-from-ptr
           :lisp->c '(lambda (v) (si:chunk-data (,fnew-chunk-with-check v))))) ;; ŽÀ‚Í‚¢‚ç‚È‚¢

       (defun ,ftoalist (wrapper)
         (,fsync-c2l wrapper)
         (list
          ,@(mapcar #'(lambda (e)
                        (multiple-value-bind (slot type lisp-attr c-attr)
                            (values-list e)
                          `(cons ,(intern (string slot) :keyword)
                                 (,lisp-attr wrapper))))
                    lisp/c-accessors)))
       (export ',ftoalist)

       (defun ,ftolist (wrapper)
         (,fsync-c2l wrapper)
         (list
          ,@(mapcar #'(lambda (e)
                        (multiple-value-bind (slot type lisp-attr c-attr)
                            (values-list e)
                          `(,lisp-attr wrapper)))
                    lisp/c-accessors)))
       (export ',ftolist)

       (defun ,fvalues (wrapper)
         (,fsync-c2l wrapper)
         (values-list (,ftolist wrapper)))
       (export ',fvalues)

       (defun ,fcheck (arg)
         (check-type arg ,name))

       (defun ,fsync-c2l (wrapper)
         (setf
          ,@(mapcan #'(lambda (e)
                        (multiple-value-bind (slot type lisp-attr c-attr)
                            (values-list e)
                          `((,lisp-attr wrapper)
                            (,(c->lisp-converter type) (,c-attr (,fchunk wrapper))))))
                    lisp/c-accessors)))

       (defun ,fsync-l2c (wrapper)
         (setf
          ,@(mapcan #'(lambda (e)
                        (multiple-value-bind (slot type lisp-attr c-attr)
                            (values-list e)
                          `((,c-attr (,fchunk wrapper))
                            (,(lisp->c-converter type) (,lisp-attr wrapper)))))
                    lisp/c-accessors)))

       (defun ,fnew-chunk-with-check (struct)
         (,fcheck struct)
         (,fsync-l2c struct)
         (,fchunk struct))

       (defun ,fmake-from-chunk (chunk)
         (let ((r (,fmake :chunk chunk)))
           (,fsync-c2l r)
           r))

       (defun ,fmake-from-ptr (ptr)
         (,fmake-from-chunk (si:make-chunk ',c-struct ,(sizeof c-struct) nil ptr)))

       (export-structure ',name)
       )))


;;;; c-enum wrapper

(defmacro define-autoboxing-for-c-enum (c-enum)
  (let ((c->lisp (symbol-join c-enum "-c->lisp"))
        (lisp->c (symbol-join c-enum "-lisp->c"))
        (enum-fn (symbol-join c-enum "-enum"))
        (name-fn (symbol-join c-enum "-enum-name"))
        (value-fn (symbol-join c-enum "-enum-value")))
    `(progn
       (defun ,c->lisp (v)
         (let ((r (,name-fn v)))
           (unless r
             (raise-cairo-argument-error "unsupported enum value `~S'." v))
           r))

       (defun ,lisp->c (v)
         (let ((r (,value-fn v)))
           (unless r
             (raise-cairo-argument-error "unknown enum value `~S': valid values are ~S."
                                         v (mapcar #'car (,enum-fn))))
           r))

       (define-autoboxing-for (,c-enum)
         :c->lisp ',c->lisp
         :lisp->c ',lisp->c))))


(provide "cairo/api/macros")

;;;; End
