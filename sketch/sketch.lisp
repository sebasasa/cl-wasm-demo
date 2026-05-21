(defun setup ()
  (initialize-ui)
  (create_canvas "canvas")
  )


(defun draw ()
  (update-ui)
  (spawn-particle MOUSEX MOUSEY)

  (dotimes (i (length *particles*))
    (let ((p (aref *particles* i)))
      (when p
        (update-particle p)
        (if (> (particle-life p) 0.0)
            (draw-particle p)                   ; Alive ? Render it  
            (setf (aref *particles* i) nil))))) ; Dead  ? Erase from the pool
  )
