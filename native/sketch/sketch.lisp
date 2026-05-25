(load "sketch/particle.lisp")

; What i want is to NOT do it like this, but instead use the manifest method
; Remember that all paths are relative to the build script working directory
; Meaning it is very likely "native"


(defun setup ()
  (create_canvas 600 600 "Improved Sketch")
  )


(defun draw ()
  (background #x000000FF)

  (spawn-particle *mousex* *mousey*)
  
  (dotimes (i (length *particles*))
  (let ((p (aref *particles* i)))
    (when p
      (update-particle p)
      (if (> (particle-life p) 0.0)
          (draw-particle p)                   ; Alive ? Render it  
          (setf (aref *particles* i) nil))))) ; Dead  ? Erase from the pool
)