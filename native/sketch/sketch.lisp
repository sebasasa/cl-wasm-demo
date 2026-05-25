(defun setup ()
  (create_canvas 600 600 "canvas")
  (initialize-ui)
  )

(defun draw ()
  (background #x000000FF)
  (update-ui)

  (spawn-particle *mousex* *mousey*)
  
  (dotimes (i (length *particles*))
    (let ((p (aref *particles* i)))
      (when p
        (update-particle p)
        (if (> (particle-life p) 0.0)
            (draw-particle p)                   ; Alive ? Render it  
            (setf (aref *particles* i) nil))))) ; Dead  ? Erase from the pool
)