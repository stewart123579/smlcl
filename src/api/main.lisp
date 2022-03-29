(defpackage smlcl-api
  (:use :cl :smlcl-core)
  (:nicknames :smlcl)
  (:import-from :dexador)
  (:import-from :cl-json)
  (:export
   ;; Embeddings
   #:embed
   ))

(in-package :smlcl-api)

(defparameter *smls-url* "http://localhost:8000"
  "The URL of the smls server")

(defun set-smls-url (url)
  "Set the URL of the smls server"
  (setf *smls-url* url))
