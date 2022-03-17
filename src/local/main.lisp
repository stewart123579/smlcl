(defpackage smlcl-local
  (:use :cl)
  (:export
   ;; Embeddings
   #:embed

   ;; Python related
   #:switch-python
   #:py-cd
   #:py-sys-path))

(in-package :smlcl-local)
