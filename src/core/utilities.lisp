(in-package :smlcl)

;; Array functions

(defun acol (array col-number)
  "Return list of elements in AXIS-NUMBER for ARRAY"
  (loop for i from 0 below (array-dimension array 0)
        collect (aref array i col-number)))


;; Enumeration - useful for plotting

(defun enumerate (l &key (test #'eql) (enums nil enums-p))
  "Returns an alist mapping unique items in L to integers

:TEST for key comparison
:ENUMS to use existing enumeration list"
  (let ((uniq (remove-duplicates l :test test))
        (biggest 0))
    (when enums-p
      ;; If enums provided, get the list of known-keys and the largest enum
      ;; number seen, then remove any known-keys from the list of unique keys
      (multiple-value-bind (known-keys big)
          (loop for item in enums
                collect (car item) into known-keys
                maximize (cdr item) into big
                minimize (cdr item) into small
                finally (return (values known-keys big small)))
        (setf uniq (remove-if (lambda (it) (find it known-keys :test test))
                              uniq)
              biggest big)))
    ;; Add any unique keys to the enum list
    (loop for item in uniq
          for i from (1+ biggest)
          do (push (cons item i) enums))
    enums))

;; (enumerate '(a b c a))


(defun enum-list (l &rest rest &key (test #'eql) &allow-other-keys)
  "Convert a list to a list of symbols and also return the mapping alist"
  (let ((enums (apply #'enumerate l rest)))
    (values
     (mapcar (lambda (x) (cdr (assoc x enums :test test))) l)
     enums)))

;; (enumerate '("aaa" "bbb" "ccc" "aaa") :test #'string=)
;; (enum-list '("aaa" "bbb" "ccc" "aaa") :test #'string= :enums '(("bbb" . 11) ("d" . 1)))
