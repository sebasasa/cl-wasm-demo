;; Load the bridge
(ffi:load-foreign-library "libfunction.dylib")

;; Expose C bridge
(ffi:clines "extern void init_my_window(int w, int h, const char* title);")
(ffi:clines "extern void close_my_window();")
(ffi:clines "extern bool should_close();")
(ffi:clines "extern void begin_draw();")
(ffi:clines "extern void end_draw();")
(ffi:clines "extern void clear_bg(unsigned int color);")

;; Map functions
(defun init-window (w h title) (ffi:c-inline (w h title) (:int :int :cstring) :void "init_my_window(#0, #1, #2)" :one-liner t))
(defun close-window () (ffi:c-inline () () :void "close_my_window()" :one-liner t))
(defun window-should-close-p () (ffi:c-inline () () :bool "should_close()" :one-liner t))
(defun begin-drawing () (ffi:c-inline () () :void "begin_draw()" :one-liner t))
(defun end-drawing () (ffi:c-inline () () :void "end_draw()" :one-liner t))
(defun clear-background (color) (ffi:c-inline (color) (:unsigned-int) :void "clear_bg(#0)" :one-liner t))

;; Engine logic
(load "sketch.lisp")

(defun run-engine ()
  (setup) ;; Calls user defined setup
  (loop until (window-should-close-p) do
    (draw)) ;; Calls user defined draw
  (close-window))

(run-engine)