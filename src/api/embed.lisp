(in-package :smlcl-api)

(defun embed (messages)
  "Embed messages using the HTTP/POST server

   Should add something about &key parameters for URL and model number"
  (let ((result (dex:post (uiop:strcat *smls-url* "/embed")
                          :content `(("message" . ,(json:encode-json-to-string messages))))))
    (rest (first (json:decode-json-from-string result)))))
