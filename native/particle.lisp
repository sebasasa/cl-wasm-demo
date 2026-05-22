(defstruct particle
  (x 0.0 :type single-float)
  (y 0.0 :type single-float)
  (vx 0.0 :type single-float)
  (vy 0.0 :type single-float)
  (life 1.0 :type single-float))

(defvar *particles* (make-array 50 :initial-element nil))

;; 10 hex colors from purple to green
(defvar *colors* '("#800080" "#8B008B" "#9370DB" "#7B68EE" "#6A5ACD" 
                   "#483D8B" "#3CB371" "#2E8B57" "#008000" "#006400"))


(defun spawn-particle (start-x start-y)
  "Finds an empty slot and generates a direction using the mouse positions as a variation seed."
  (let ((index (position nil *particles*)))
    (when index
      (let* ((seed-x (+ start-x index))
             (seed-y (+ start-y index))
             (random-vx (- (mod seed-x 7) 3))
             (random-vy (- (mod seed-y 5) 3)))
        (setf (aref *particles* index)
              (make-particle :x (float start-x)
                             :y (float start-y)
                             :vx (float random-vx)
                             :vy (float random-vy)
                             :life 1.0))))))

(defvar *last-fill* nil)

(defvar sizeScale 30)  ; Deffault size is 15

(defun draw-particle (p)
  "Renders a particle as an ellipse that shrinks and fades over its lifetime."
  (when p
    (let* ((life (particle-life p))
           ;; Map life 1.0-0.0 to color index 0-9
           (color-idx (max 0 (min 9 (round (* (- 1.0 life) 10.0)))))
           (color (nth color-idx *colors*))
           (size (round (* sizeScale life))))
      
      ;; Only call the bridge if the color is different from the last one
      (unless (string= color *last-fill*)
        (set-fill color)
        (setf *last-fill* color))
        
      (ellipse (round (particle-x p)) 
               (round (particle-y p)) 
               size 
               size))))

(defun update-particle (p)
  ;; Update position coordinates
  (setf (particle-x p) (+ (particle-x p) (particle-vx p)))
  (setf (particle-y p) (+ (particle-y p) (particle-vy p)))
  
  ;; Reduce life
  (setf (particle-life p) (- (particle-life p) 0.02))
)
