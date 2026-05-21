(defstruct particle
  (x 0.0 :type single-float)
  (y 0.0 :type single-float)
  (vx 0.0 :type single-float)
  (vy 0.0 :type single-float)
  (life 1.0 :type single-float))

(defvar *particles* (make-array 50 :initial-element nil))

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

