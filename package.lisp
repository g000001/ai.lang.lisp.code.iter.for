;;;; package.lisp

(cl:in-package :cl-user)

(defpackage :ai.lang.lisp.code.iter.for
  (:use)
  (:export :for))

(defpackage :ai.lang.lisp.code.iter.for.internal
  (:use :ai.lang.lisp.code.iter.for :cl :fiveam))

