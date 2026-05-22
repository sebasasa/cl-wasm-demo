(in-package :cl-user)

(ffi:clines "#include \"raylib-5.0_macos/include/raylib.h\"")

;; Load raylib from the local path
(ffi:load-foreign-library 
 (merge-pathnames "raylib-5.0_macos/lib/libraylib.dylib" *default-pathname-defaults*))

(ffi:def-function ("InitWindow" init-window)
    ((width :int)
     (height :int)
     (title :cstring))
  :returning :void)

(ffi:def-function ("CloseWindow" close-window) () :returning :void)

(ffi:def-function ("WindowShouldClose" window-should-close) () :returning :int)

(ffi:def-function ("BeginDrawing" begin-drawing) () :returning :void)

(ffi:def-function ("EndDrawing" end-drawing) () :returning :void)

(defun spawn-window ()
  (init-window 800 600 "ECL FFI Raylib Window")
  (loop while (= 0 (window-should-close))
        do (begin-drawing)
           (end-drawing))
  (close-window))

(spawn-window)
