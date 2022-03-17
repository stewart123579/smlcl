(defsystem "smlcl-api"
  :version "0.1.0"
  :author "Stewart V. Wright"
  :license "MIT"
  :depends-on ("smlcl"
               "dexador"
               "cl-json")
  :components ((:module "src/api"
                :components
                ((:file "main")
                 (:file "embed" :depends-on ("main"))
                 )))
  :description "Implementation of the ML functions called via an API"
  :in-order-to ((test-op (test-op "smlcl-api/tests"))))


(defsystem "smlcl-api/tests"
  :author "Stewart V. Wright"
  :license "MIT"
  :depends-on ("smlcl-api"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main-api")
                 (:file "embedding" :depends-on ("main-api")))))
  :description "Test system for smlcl-api"
  :perform (test-op (op c) (symbol-call :rove :run c)))
