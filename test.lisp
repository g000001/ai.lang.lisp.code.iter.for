(cl:in-package :ai.lang.lisp.code.iter.for.internal)
;; (in-readtable :ai.lang.lisp.code.iter.for)

(def-suite ai.lang.lisp.code.iter.for)

(in-suite ai.lang.lisp.code.iter.for)

(defmacro == (x y)
  `(is (equal ,x ,(copy-tree y))))


(test from-to-collect
  (== (for i :from 0 to 8 :collect i)
      '(0 1 2 3 4 5 6 7 8))
  (== (for i from 5 to -5 collect i)
      '(5 4 3 2 1 0 -1 -2 -3 -4 -5))
  (== (for elt :in '(1 2 3 4) :collect elt :collect elt)
      ;; ???
      '(4 4 3 3 2 2 1 1))
  (== (for elt :in '(1 2 3 4) :collect elt)
      '(1 2 3 4))
  (== (for elt :on '(1 2 3 4) :collect elt)
      '((1 2 3 4) (2 3 4) (3 4) (4)))
  (== (for elt :in '(nil 1 2 nil 3 4) :join (and elt (list elt)))
      '(1 2 3 4))
  (== (for elt :in '(1 2 3 4) :count elt)
      4)
  ;; as
  (== (for :as elt :in '(1 2 3 4) :collect elt)
      '(1 2 3 4))
  ;; always
  (== (for elt :in '(t nil t nil) :always elt)
      NIL)
  ;; bind
  (== (for :bind ((base 100))
           :as elt :in '(1 2 3 4) :collect (+ base elt))
      '(101 102 103 104))
  (== (for elt :in '(t t t t) :always elt)
      T)
  (== (for elt :in '(t nil t nil) :never elt)
      NIL)
  (== (for elt :in '(nil nil nil nil) :never elt)
      T))

;;; eof







