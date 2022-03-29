(in-package :smlcl)

;; Array functions

(defun acol (array col-number)
  "Return list of elements in AXIS-NUMBER for ARRAY"
  (loop for i from 0 below (array-dimension array 0)
        collect (aref array i col-number)))


;; Enumeration - useful for plotting

(defun enumerate (l &key (test #'eql))
  "Returns an alist mapping unique items in L to integers"
  (let ((uniq (remove-duplicates l :test test)))
    (loop for item in uniq
          for i from 1
          ;; collect (cons item (make-symbol (princ-to-string i)))
          collect (cons item i))))

;; (enumerate '(a b c a))


(defun enum-list (l &rest rest &key (test #'eql) &allow-other-keys)
  "Convert a list to a list of symbols and also return the mapping alist"
  (let ((enums (apply #'enumerate l rest)))
    (values
     (mapcar (lambda (x) (cdr (assoc x enums :test test))) l)
     enums)))

;; (enumerate '("aaa" "bbb" "ccc" "aaa") :test #'string=)
;; (enum-list '("aaa" "bbb" "ccc" "aaa") :test #'string= :enums '(("bbb" . 11) ("d" . 1)))
