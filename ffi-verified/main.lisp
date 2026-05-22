(ffi:clines "#include \"mylib.h\"")
(defun lisp-add (x y)
  (ffi:c-inline (x y) (:int :int) :int 
                "add_numbers(#0, #1)" 
                :one-liner t))
(defun main ()
  (format t "Result from C function: ~A~%" (lisp-add 15 27)))
(main)
