;;;; ai.lang.lisp.code.iter.for.asd -*- Mode: Lisp;-*- 

(cl:in-package :asdf)

(defsystem :ai.lang.lisp.code.iter.for
  :serial t
  :depends-on (:fiveam)
  :components ((:file "package")
               (:file "ai.lang.lisp.code.iter.for")
               (:file "test")))

(defmethod perform ((o test-op) (c (eql (find-system :ai.lang.lisp.code.iter.for))))
  (load-system :ai.lang.lisp.code.iter.for)
  (or (flet ((_ (pkg sym)
               (intern (symbol-name sym) (find-package pkg))))
         (let ((result (funcall (_ :fiveam :run) (_ :ai.lang.lisp.code.iter.for.internal :ai.lang.lisp.code.iter.for))))
           (funcall (_ :fiveam :explain!) result)
           (funcall (_ :fiveam :results-status) result)))
      (error "test-op failed") ))

