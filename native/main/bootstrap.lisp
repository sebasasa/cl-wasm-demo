; Currently we MANUALLY load the user scripts
; This file should probably be generated programatically based on the contents of the manifest
; We could even do that directly with a simple bash script, even directly inside of build.sh

(load "sketch/sketch.lisp")

(defun render-canvas () 
  (begin-drawing)
  (draw-canvas 0 0)
  (end-drawing)
  )

; To preven double buffering problems we actually draw to a textute (defined as global in bindings.c)
; This texture is called canvas, and to use it seamlessly, before each execution of draw we:
  ; Load the texture
  ; Draw onto it with out drawing functions
  ; Close the texture
  ; Render the texture

; Related to this, the function for "create-canvas" in library.lisp takes care of both creating the actual window, but also creating the canvas texture of that same size

(defun run-engine ()
  (setup)
  (loop until (window-should-close-p) do
    (update-mouse)
    (begin-canvas)
    (draw)
    (end-canvas)
    (render-canvas)
    )
  (close-window))

(run-engine)