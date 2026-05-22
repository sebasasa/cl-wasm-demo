(in-package :cl-user)
(ffi:clines "extern void print_planet();")
(ffi:load-foreign-library (merge-pathnames "libcustom.dylib" *default-pathname-defaults*))

(defun call-print-planet ()
  (ffi:c-inline () () :void "print_planet();" :one-liner t))

(compile 'call-print-planet)
(call-print-planet)
(quit)
