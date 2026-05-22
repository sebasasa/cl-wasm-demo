(ffi:def-function ("printf" c-printf)
    ((format :cstring)
     (arg :cstring))
  :returning :int)

(c-printf "Hello from C, printed via ECL FFI: %s~%" "Success!")
(quit)
