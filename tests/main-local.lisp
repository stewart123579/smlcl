(defpackage smlcl/tests/embedding
  (:use :cl :rove)
  (:import-from :smlcl-local))

(defpackage smlcl/tests/main
  (:use :cl :rove)
  (:import-from :smlcl-local))

(in-package :smlcl/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :smlcl)' in your Lisp.
