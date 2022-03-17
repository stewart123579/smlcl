(defsystem "smlcl"
  :version "0.1.0"
  :author "Stewart V. Wright"
  :license "MIT"
  ;; :depends-on ("dexador"
  ;;              "cl-json"
  ;;              "py4cl")
  :components ((:module "src/core"
                :components
                ((:file "main")
                 (:file "utilities" :depends-on ("main"))
                 )))
  :description "Common / core smlcl functionality"
  :in-order-to ((test-op (test-op "smlcl/tests"))))


(defsystem "smlcl/tests"
  :author "Stewart V. Wright"
  :license "MIT"
  :depends-on ("smlcl"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main")
                 (:file "embedding" :depends-on ("main")))))
  :description "Test system for smlcl"
  :perform (test-op (op c) (symbol-call :rove :run c)))
