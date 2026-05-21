
(defun setup ()
  "Runs once to initialize DOM elements and canvas context."
  (setf *my-div* (js-get-element-by-id [document] "target"))
  (let ((canvas-obj (js-get-element-by-id [document] "canvas")))
    (setf *ctx* (canvas-get-context canvas-obj "2d")))
  
  ;; Listen to mouse changes to update global tracking variables
  (js-add-event-listener [window] "mousemove"
                        (lambda-js-callback :null ((event :js-ref))
                           (setf *mx* (get-client-x event))
                           (setf *my* (get-client-y event)))))

(defun draw ()
  "Runs continuously at the browser frame rate."
  ;; Clear the frame background so we don't leave endless solid trails

  ; This will make sense once we add white as a color, as of now let's comment it out 
  ; (canvas-fill-rect *ctx* 0 0 400 400)

  ;; Spawn a single particle under the current mouse tracking position
  (spawn-particle *mx* *my*)
  
  ;; Loop through and update all active particles in the array
  (dotimes (i (length *particles*))
    (let ((p (aref *particles* i)))
      (when p
        ;; Update position coordinates
        (setf (particle-x p) (+ (particle-x p) (particle-vx p)))
        (setf (particle-y p) (+ (particle-y p) (particle-vy p)))
        
        ;; Tick down the life expectancy
        (setf (particle-life p) (- (particle-life p) 0.02))
        
        (if (> (particle-life p) 0.0)
            ;; Render the square using your known canvas-fill-rect tool
            (let ((size (round (* 15 (particle-life p)))))
              (canvas-fill-rect *ctx* 
                                (round (particle-x p)) 
                                (round (particle-y p)) 
                                size 
                                size))
            ;; Erase from the pool when dead
            (setf (aref *particles* i) nil)))))
  
  ;; Perform the frame's DOM text update exactly like your baseline
  (setf (inner-html *my-div*)
        (format nil "Drawing box at X: ~A | Y: ~A" *mx* *my*)))
