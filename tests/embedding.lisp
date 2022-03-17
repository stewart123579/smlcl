(in-package :smlcl/tests/embedding)

;; NOTE: To run this test file, execute `(asdf:test-system :smlcl)' in your Lisp.

;; Replicate the results from:
;;   https://www.tensorflow.org/hub/tutorials/semantic_similarity_with_tf_hub_universal_encoder

(defparameter *messages* `("Elephant"
                           "I am a sentence for which I would like to get its embedding."
                           ,(uiop:strcat
                             "Universal Sentence Encoder embeddings also support short paragraphs. "
                             "There is no hard limit on how long the paragraph is. Roughly, the longer "
                             "the more 'diluted' the embedding will be.")))

(defparameter *embeddings* '((0.008344483561813831 0.000480843911645934 0.06595247238874435)
                             (0.050808604806661606 -0.01652432791888714 0.01573779620230198)
                             (-0.02833268605172634 -0.0558621808886528 -0.012941482476890087))
  "These are the first three embeddings from running the python code.  NOTE that these are slightly different from the results in the Tensorflow example page.  You'll need to run the python code and cut-and-paste yourself to get the correct results for the version of the model you have downloaded")


(deftest test-tf-example
  (testing "are the encodings the same as on the Tensorflow website?"
    (let ((embeddings (smlcl:embed *messages*)))
      (loop for message in *messages*
            for correct in *embeddings*
            for result in embeddings
            do (progn
                 (format t "- Testing embedding of: ~a~&" message)
                 (ok (equalp correct (subseq result 0 3))))))))
