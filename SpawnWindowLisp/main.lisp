(ffi:load-foreign-library "libfunction.dylib")
(ffi:clines "void start_raylib_window();")

(defun run-game ()
  (ffi:c-inline () () :void "start_raylib_window()" :one-liner t))

(run-game)