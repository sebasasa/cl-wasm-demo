(ffi:def-function ("printf" c-printf)
    ((format :cstring)
     (arg :cstring))
  :returning :int)

(defun test-printf ()
  (c-printf "Hello from C, printed via ECL FFI: %s~%" "Success!"))

(test-printf)
