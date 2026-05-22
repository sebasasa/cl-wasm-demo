;; Load Raylib
(ffi:load-foreign-library (merge-pathnames "libraylib.dylib" (or *load-truename* *default-pathname-defaults*)))

;; --- Raylib FFI Definitions (Dynamic) ---

(ffi:def-foreign-call ("InitWindow" init-window) ((width :int) (height :int) (title :cstring)) :returning :void)
(ffi:def-foreign-call ("SetTargetFPS" set-target-fps) ((fps :int)) :returning :void)
(ffi:def-foreign-call ("WindowShouldClose" window-should-close) () :returning :bool)
(ffi:def-foreign-call ("BeginDrawing" begin-drawing) () :returning :void)
(ffi:def-foreign-call ("EndDrawing" end-drawing) () :returning :void)
(ffi:def-foreign-call ("ClearBackground" clear-background) ((color :unsigned-int)) :returning :void)
(ffi:def-foreign-call ("DrawRectangle" draw-rectangle) ((x :int) (y :int) (w :int) (h :int) (color :unsigned-int)) :returning :void)
(ffi:def-foreign-call ("DrawEllipse" draw-ellipse) ((cx :int) (cy :int) (rh :float) (rv :float) (color :unsigned-int)) :returning :void)
(ffi:def-foreign-call ("DrawCircle" draw-circle) ((cx :int) (cy :int) (r :float) (color :unsigned-int)) :returning :void)
(ffi:def-foreign-call ("GetMouseX" get-mouse-x) () :returning :int)
(ffi:def-foreign-call ("GetMouseY" get-mouse-y) () :returning :int)
(ffi:def-foreign-call ("CloseWindow" close-window) () :returning :void)

;; --- Sketch API Compatibility ---
(defvar MOUSEX 0)
(defvar MOUSEY 0)

(defun make-color (r g b &optional (a 255))
  (logior (logand r #xFF)
          (ash (logand g #xFF) 8)
          (ash (logand b #xFF) 16)
          (ash (logand a #xFF) 24)))

(defvar *current-color* (make-color 255 255 255 255))

(defun set-fill (c) (setf *current-color* (hex-to-color c)))
(defun hex-to-color (h) 
  (let ((r (parse-integer h :start 1 :end 3 :radix 16))
        (g (parse-integer h :start 3 :end 5 :radix 16))
        (b (parse-integer h :start 5 :end 7 :radix 16)))
    (make-color r g b 255)))

(defun rect (x y w h) (draw-rectangle x y w h *current-color*))
(defun ellipse (x y w h) (draw-ellipse x y (float (/ w 2)) (float (/ h 2)) *current-color*))
(defun circle (x y r) (draw-circle x y (float r) *current-color*))

(defun create_canvas (name)
  (declare (ignore name))
  (init-window 800 600 "Quicle Native Sketch")
  (set-target-fps 60))

(defun initialize-ui () (format t "UI Init~%"))
(defun update-ui ()
  (setf MOUSEX (get-mouse-x) MOUSEY (get-mouse-y)))
