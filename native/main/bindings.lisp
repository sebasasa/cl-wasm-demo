(ffi:load-foreign-library "bin/libfunction.dylib")

;; Expose C bridge
(ffi:clines "extern void init_my_window(int w, int h, const char* title);")
(ffi:clines "extern void close_my_window();")
(ffi:clines "extern bool should_close();")
(ffi:clines "extern void begin_draw();")
(ffi:clines "extern void end_draw();")
(ffi:clines "extern float get_frame_time();")
(ffi:clines "extern void clear_bg(unsigned int color);")
(ffi:clines "extern void draw_rect(int x, int y, int w, int h, unsigned int c);")
(ffi:clines "extern void draw_circle(int x, int y, float r, unsigned int c);")
(ffi:clines "extern void draw_line(int x1, int y1, int x2, int y2, unsigned int c);")
(ffi:clines "extern void draw_text(const char* t, int x, int y, int sz, unsigned int c);")
(ffi:clines "extern bool is_key_down(int key);")
(ffi:clines "extern int get_mouse_x();")
(ffi:clines "extern int get_mouse_y();")
(ffi:clines "extern void set_target_fps(int fps);")

;; Map functions
(defun init-window (w h title) (ffi:c-inline (w h title) (:int :int :cstring) :void "init_my_window(#0, #1, #2)" :one-liner t))
(defun close-window () (ffi:c-inline () () :void "close_my_window()" :one-liner t))
(defun window-should-close-p () (ffi:c-inline () () :bool "should_close()" :one-liner t))
(defun begin-drawing () (ffi:c-inline () () :void "begin_draw()" :one-liner t))
(defun end-drawing () (ffi:c-inline () () :void "end_draw()" :one-liner t))
(defun get-frame-time () (ffi:c-inline () () :float "get_frame_time()" :one-liner t))
(defun clear-background (color) (ffi:c-inline (color) (:unsigned-int) :void "clear_bg(#0)" :one-liner t))
(defun draw-rectangle (x y w h c) (ffi:c-inline (x y w h c) (:int :int :int :int :unsigned-int) :void "draw_rect(#0, #1, #2, #3, #4)" :one-liner t))
(defun draw-circle (x y r c) (ffi:c-inline (x y r c) (:int :int :float :unsigned-int) :void "draw_circle(#0, #1, #2, #3)" :one-liner t))
(defun draw-line (x1 y1 x2 y2 c) (ffi:c-inline (x1 y1 x2 y2 c) (:int :int :int :int :unsigned-int) :void "draw_line(#0, #1, #2, #3, #4)" :one-liner t))
(defun draw-text (txt x y sz c) (ffi:c-inline (txt x y sz c) (:cstring :int :int :int :unsigned-int) :void "draw_text(#0, #1, #2, #3, #4)" :one-liner t))
(defun is-key-down (key) (ffi:c-inline (key) (:int) :bool "is_key_down(#0)" :one-liner t))
(defun get-mouse-x () (ffi:c-inline () () :int "get_mouse_x()" :one-liner t))
(defun get-mouse-y () (ffi:c-inline () () :int "get_mouse_y()" :one-liner t))
(defun set-target-fps(fps) (ffi:c-inline (fps) (:int) :void "set_target_fps(#0)" :one-liner t))

; Added this one to handle textures
(ffi:clines "extern void init_global_canvas(int w, int h);")
(ffi:clines "extern void begin_global_canvas();")
(ffi:clines "extern void end_global_canvas();")
(ffi:clines "extern void draw_global_canvas(int x, int y);")

(defun init-global-canvas (w h) 
  (ffi:c-inline (w h) (:int :int) :void "init_global_canvas(#0, #1)" :one-liner t))

(defun begin-canvas () 
  (ffi:c-inline () () :void "begin_global_canvas()" :one-liner t))

(defun end-canvas () 
  (ffi:c-inline () () :void "end_global_canvas()" :one-liner t))

(defun draw-canvas (x y) 
  (ffi:c-inline (x y) (:int :int) :void "draw_global_canvas(#0, #1)" :one-liner t))
  
(load "main/library.lisp")
(load "main/bootstrap.lisp")


