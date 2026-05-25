(defstruct particle
  (x 0.0 :type single-float)
  (y 0.0 :type single-float)
  (vx 0.0 :type single-float)
  (vy 0.0 :type single-float)
  (life 1.0 :type single-float))

(defvar *particles* (make-array 200 :initial-element nil))

(defvar spread 1)

(defun spawn-particle (start-x start-y)
  "Finds an empty slot and generates a direction using the mouse positions as a variation seed."
  (let ((index (position nil *particles*)))
    (when index
      (let* ((seed-x (+ start-x index))
             (seed-y (+ start-y index))
             (random-vx (* (- (random 2.0) 1) spread) )
             (random-vy (* (- (random 2.0) 1) spread) )
             )
        (setf (aref *particles* index)
              (make-particle :x (float start-x)
                             :y (float start-y)
                             :vx (float random-vx)
                             :vy (float random-vy)
                             :life 1.0))))))

(defvar *colors* '(
  #x800080FF #x8B008BFF #x9370DBFF #x7B68EEFF #x6A5ACDFF 
  #x483D8BFF #x3CB371FF #x2E8B57FF #x008000FF #x006400FF
))

(defvar sizeScale 30)  ; Deffault size is 15

(defun draw-particle (p)
  (when p
    (let* ((life  (particle-life p))
           (size  (round (* sizeScale life)))
           (color (nth (floor (* life 10)) (reverse *colors*)) )
           )

      (draw-circle (round (particle-x p)) 
        (round (particle-y p)) 
        size 
        color
        )    
      )
    )
  )

               

(defun update-particle (p)
  ;; Update position coordinates
  (setf (particle-x p) (+ (particle-x p) (particle-vx p)))
  (setf (particle-y p) (+ (particle-y p) (particle-vy p)))
  
  ;; Reduce life
  (setf (particle-life p) (- (particle-life p) 0.02))
)

