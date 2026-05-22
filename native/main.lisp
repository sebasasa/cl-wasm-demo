(load "bindings.lisp")
(load "sketch.lisp")

(defun main ()
  (setup)
  (loop while (not (window-should-close))
        do (draw))
  (ffi:c-inline () () :void "CloseWindow()" :one-liner t))

(main)
