;;;; -*- mode: lisp; package: cairo.ffi -*-
;;;;
;;;; File: cairo/ffi/macros.l
;;;;
;;;; License:
;;;;
;;;;   Copyright (c) 2007,2009 MIYAMUKO Katsuyuki.
;;;;
;;;;   xl-cairo is released under an MIT license.
;;;;   See cairo/docs/MIT-LICENSE for full license.
;;;;

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "cairo/ffi/package")
  (require "cairo/ffi/dll")
  (require "cairo/ffi/util")
  (require "cairo/util/sequence")
  (require "cairo/util/symbol")
  )

(in-package :cairo.ffi)

(defmacro define-library (macroname dll &optional func-converter)
  `(progn
     (defmacro ,macroname (return-type name (&rest args-with-name))
       (let ((export-name ,(if func-converter
                               `(funcall ,func-converter name)
                             `(progn name)))
             (args (mapcar #'car args-with-name)))
         `(progn
            (c:*define-dll-entry ,return-type ,name ,args
              ,',dll ,(string export-name))
            (setf (get ',name 'foreign-type) 'dll-entry-point))))
     (setf (get ',macroname 'ed:lisp-indent-hook) 'defun)))

(defmacro define-callback-function (return-type name (&rest args-with-name))
  (let ((impl (symbol-join name "-impl")))
    `(progn
       (c:define-c-type c:void* ,name)
       (unless (fboundp ',name)
         (c:*defun-c-callable ,return-type ,name (,@args-with-name)
           (,impl ,@(mapcar #'cadr args-with-name))))
       (setf (get ',name 'foreign-type) 'callback-function))))


(defmacro define-c-pointer-type (name &optional pointer-name)
  `(progn
     (c:*define-c-type (,name *) ,(or pointer-name (symbol-join name #\*)))
     (setf (get ',(or pointer-name (symbol-join name #\*)) 'foreign-type)
           'c-pointer)
     (setf (get ',(or pointer-name (symbol-join name #\*)) 'c-pointer-type)
           ',(symbol-join "c-pointer-of-" (or (get name 'c-pointer-type)
                                              (get name 'foreign-type))))))

(defmacro define-c-pointer-type2 (name)
  `(progn
    (define-c-pointer-type ,name)
    (define-c-pointer-type ,(symbol-join name #\*))))

(defmacro define-c-pointer-types (&body body)
  `(progn
    ,@(mapcar #'(lambda (e)
                  `(define-c-pointer-type ,@(if (atom e) (list e) e)))
              body)))


(defmacro define-c-struct-with-ptr (name &rest slots)
  `(progn
     (c:*define-c-struct ,name ,@slots)
     (setf (get ',name 'foreign-type) 'c-struct)
     ,@(mapcar #'(lambda (slot)
                   `(setf (get ',(symbol-join name "-" (cadr slot)) 'c-struct-type) ',(car slot)))
               slots)
     (define-c-pointer-type2 ,name)))
(setf (get 'define-c-struct 'ed:lisp-indent-hook) 'defstruct)

(defmacro define-c-private-struct-with-ptr (name)
  `(progn
     (c:*define-c-type c:void ,name)
     (setf (get ',name 'foreign-type) 'c-private-struct)
     (define-c-pointer-type2 ,name)))


(defun c-union-size (slots)
  (apply #'max (mapcar #'sizeof (mapcar #'car slots))))

(defmacro define-c-union-with-ptr (name &rest slots)
  `(progn
     (c:*define-c-struct ,name
       (c:char _body ,(c-union-size slots)))
     (setf (get ',name 'foreign-type) 'c-union)
     (define-c-pointer-type2 ,name)))
(setf (get 'define-c-union 'ed:lisp-indent-hook) 'defstruct)


(defun make-c-enum-helper (enum &optional (index 0))
  (let ((e (car enum)) (rst (cdr enum)))
    (cond ((null e) nil)
          ;; :foo
          ((symbolp e)
           (cons (cons e index)
                 (make-c-enum-helper rst (1+ index))))
          ;; (:foo)
          ((singlep e)
           (cons (cons (car e) index)
                 (make-c-enum-helper rst (1+ index))))
          ;; (:foo 1)
          ((doublep e)
           (cons (cons (car e) (cadr e))
                 (make-c-enum-helper rst (1+ (cadr e)))))
          ;; (:foo . 1)
          ((dotp e)
           (cons (cons (car e) (cdr e))
                 (make-c-enum-helper rst (1+ (cdr e)))))
          (t
           (error "不正な列挙体リストです。")))))

(defmacro define-c-enum-with-ptr (name &rest enum)
  (when (endp enum)
    (error "列挙体リストがありません: ~A" name))
  (let ((enum-fn (symbol-join name "-enum"))
        (name-fn (symbol-join name "-enum-name"))
        (value-fn (symbol-join name "-enum-value"))
        (c-enum-value (make-c-enum-helper (mapcar #'cdr enum))))
    `(progn
       (c:*define-c-type c:int ,name)
       (setf (get ',name 'foreign-type) 'c-enum)
       (define-c-pointer-type2 ,name)

       (setf (get ',name 'c-enum) '(,@c-enum-value))
       (defun ,enum-fn ()
         (get ',name 'c-enum))

       (defun ,name-fn (value)
         (when value
           (if (keywordp value)
               (,name-fn (,value-fn value))
             (car (rassoc value (,enum-fn))))))

       (defun ,value-fn (name)
         (when name
           (if (integerp name)
               (,value-fn (,name-fn name))
             (cdr (assoc name (,enum-fn))))))

       ,@(mapcar #'(lambda (enum)
                     `(progn
                        (c:*define ,(car enum) ,(cdr (assoc (cadr enum) c-enum-value)))
                        (setf (get ',(car enum) 'foreign-type) 'c-enum-const)
                        (setf (get ',(car enum) 'c-enum-name) ',name)
                        (export ',(car enum))))
                 enum)

       (export '(,enum-fn ,name-fn ,value-fn))
       )))

(setf (get 'define-c-enum 'ed:lisp-indent-hook) 'defstruct)


(defmacro check-chunk-type (chunk type)
  (let ((gchunk (gensym))
        (gtype (gensym)))
    `(let ((,gchunk ,chunk)
           (,gtype ',type))
       (unless (eq (type-of ,gchunk) 'system:chunk)
         (error 'system::check-type-error
                :datum ,chunk
                :expected-type 'system:chunk
                :place ',chunk
                :string nil))
       (unless (eq (si:chunk-type ,gchunk) ,gtype)
         (error 'system::check-type-error
                :datum ,chunk
                :expected-type ',type
                :place ',chunk
                :string nil)))))


(defmacro define-chunk-maker-for (type)
  (let* ((fpack (symbol-join "make-" type "-chunk"))
         (funpack (symbol-join "unpack-" type)))
    `(progn
       (defun ,fpack (&optional (init-value 0))
         (make-chunk-for ',type init-value))
       (defun ,funpack (chunk)
         (check-chunk-type chunk ,type)
         (unpack-chunk-for ',type chunk))
       (export '(,fpack ,funpack)))))


(provide "cairo/ffi/macros")

;;;end
