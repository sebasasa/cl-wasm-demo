(defun setup ()
  (create_canvas 600 400 "canvas")
  (initialize-ui)
  )
  
(defun draw ()
  (update-ui)
  (spawn-particle *mousex* *mousey*)
  
  (background #x000000FF)

  (dotimes (i (length *particles*))
    (let ((p (aref *particles* i)))
      (when p
        (update-particle p)
        (if (> (particle-life p) 0.0)
            (draw-particle p)                   ; Alive ? Render it  
            (setf (aref *particles* i) nil))))) ; Dead  ? Erase from the pool
  )
