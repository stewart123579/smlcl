(in-package :smlcl-local)

(py4cl:python-exec "import smls")

(py4cl:python-exec "encoder = smls.ml_services.get('TFSentenceEncoder')")
(py4cl:import-function "encoder.run"
                       :as embed-py
                       :docstring "Embed messages using the local server")

(defun embed (messages)
  "Embed messages using the local server"
  ;; Convert from the vector returned by python to a cons (list of lists)
  (let ((embeddings (embed-py messages)))
    (loop for embedding across embeddings
          collect (loop for i across embedding collect i))))
