(defsystem "smlcl-local"
  :version "0.1.0"
  :author "Stewart V. Wright"
  :license "MIT"
  :depends-on ("smlcl-core"
               "py4cl")
  :components ((:module "src/local"
                :components
                ((:file "main")
                 (:file "mypy" :depends-on ("main"))
                 (:file "embed" :depends-on ("main" "mypy"))
                 )))
  :description "Implementation of the ML functions using locally running python"
  :in-order-to ((test-op (test-op "smlcl-local/tests"))))


(defsystem "smlcl-local/tests"
  :author "Stewart V. Wright"
  :license "MIT"
  :depends-on ("smlcl-local"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main-local")
                 (:file "embedding" :depends-on ("main-local")))))
  :description "Test system for smlcl-local"
  :perform (test-op (op c) (symbol-call :rove :run c)))
