(defpackage smlcl
  (:use :cl)
  (:export
   ;; Utilities
   ;; Array functions
   #:acol
   ;; Enumeration
   #:enumerate
   #:enum-list

   ;;;; The following are added to this package by the *-local or *-api packages
   ;; Embeddings
   #:embed
   ))

(in-package :smlcl)
