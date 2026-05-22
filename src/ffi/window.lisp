(in-package :cl-user)

(ffi:clines "#include \"raylib-5.0_macos/include/raylib.h\"")

;; Use the dylib from the raylib-5.0_macos folder
(ffi:load-foreign-library 
 (merge-pathnames "raylib-5.0_macos/lib/libraylib.dylib" (user-homedir-pathname)))

;; Bind Window functions
(ffi:def-function ("InitWindow" init-window)
    ((width :int)
     (height :int)
     (title :cstring))
  :returning :void)

(ffi:def-function ("CloseWindow" close-window) () :returning :void)

(ffi:def-function ("WindowShouldClose" window-should-close) () :returning :int)

(ffi:def-function ("BeginDrawing" begin-drawing) () :returning :void)

(ffi:def-function ("EndDrawing" end-drawing) () :returning :void)

;; Simple window loop
(defun run-window ()
  (init-window 800 600 "Hello Raylib")
  (loop while (= 0 (window-should-close))
        do (begin-drawing)
           ;; (clear-background #x181818FF)
           (end-drawing))
  (close-window))

(run-window)
(quit)
