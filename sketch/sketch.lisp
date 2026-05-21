; We are using these to manipulate the DOM
(defvar *my-div* nil)
(defun update_html_mouse () 
  (setf (inner-html *my-div*) (format nil "Drawing box at X: ~A | Y: ~A" MOUSEX MOUSEY)))


(defun setup ()
  (initialize_canvas "canvas")
  ; Create a div that we can write into
  (setf *my-div* (js-get-element-by-id [document] "target"))
)


(defun draw ()
  (update_html_mouse)
  (spawn-particle MOUSEX MOUSEY)

  ; Iterate all particles
  (dotimes (i (length *particles*))
    (let ((p (aref *particles* i)))
      (when p
        ;; Update position coordinates
        (setf (particle-x p) (+ (particle-x p) (particle-vx p)))
        (setf (particle-y p) (+ (particle-y p) (particle-vy p)))
        
        ;; Tick down the life expectancy
        (setf (particle-life p) (- (particle-life p) 0.02))
        
        (if (> (particle-life p) 0.0)
              (let ((size (round (* 15 (particle-life p)))))
                (rect (round (particle-x p)) 
                      (round (particle-y p)) 
                      size 
                      size))

            ;; Erase from the pool when dead
            (setf (aref *particles* i) nil)))))
  )
