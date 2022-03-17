(in-package :smlcl-local)

(defvar python-srcdir "./smls"
  "Specify the python SMLS source directory")

(defvar python-exec (uiop:strcat python-srcdir "/venv/bin/python3")
  "Specify the python executable (i.e. your VENV)")


(defun switch-python (path)
  "Change python executable and restart"
  (py4cl:python-stop)
  (setf py4cl::*python-command* path)
  (py4cl:python-start)
  (py4cl:python-version-info))


(switch-python python-exec)

(defun py-cd (path)
  "Change current directory in which python is running

   Also adds './' to python sys.path"
  ;; Change directory
  (py4cl:python-exec "import os")
  (py4cl:python-call "os.chdir" path)
  ;; Make sure the current directory is in our import path
  (py4cl:python-exec "import sys")
  (py4cl:python-exec "sys.path.append('./')")
  ;; (py-sys-path)
  ;; Return the current directory
  (py4cl:python-exec "print(os.getcwd())"))


(defun py-sys-path ()
  "Return the python sys.path for debugging"
  (py4cl:python-eval "sys.path"))

(py-cd python-srcdir)
