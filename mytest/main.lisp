(ffi:load-foreign-library "libfunction.dylib")

(ffi:clines "void func();")

(defun call-c-func ()
  (ffi:c-inline () () :void "func()" :one-liner t))

;; Call it
(call-c-func)