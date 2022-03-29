(defpackage smlcl-local
  (:use :cl :smlcl-core)
  (:nicknames :smlcl)
  (:export
   ;; Embeddings
   #:embed

   ;; Python related
   #:switch-python
   #:py-cd
   #:py-sys-path))

(in-package :smlcl-local)
