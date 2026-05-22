(load "sketch/particle.lisp")
; What i want is to NOT do it like this, but instead use the manifest method
; Remember that all paths are relative to the build script working directory
; Meaning it is very likely "native"




(defun setup ()
  (init-window 800 450 "Quicle Sketch")
  (set-target-fps 50)
  )

(defvar mx 0.0)
(defvar my 0.0)

(defun draw ()
  (setf mx (get-mouse-x))
  (setf my (get-mouse-y))
  (spawn-particle mx my)
  (begin-drawing)
  (clear-background #x000000FF) ;; RAYWHITE

  (draw-circle mx my 33 #xFFFFFFFF)

  (dotimes (i (length *particles*))
  (let ((p (aref *particles* i)))
    (when p
      (update-particle p)
      (if (> (particle-life p) 0.0)
          (draw-particle p)                   ; Alive ? Render it  
          (setf (aref *particles* i) nil))))) ; Dead  ? Erase from the pool

  (end-drawing))