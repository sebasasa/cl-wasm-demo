(defvar *frame-count* 0)

(defun update-ui-logic () 
  (let ((particle-count (count-if #'identity *particles*)))
    (setf (inner-html *my-div*) 
          (format nil "X: ~A | Y: ~A | Particles: ~A" MOUSEX MOUSEY particle-count))))

(defun initialize-ui ()
  (setf *my-div* (js-get-element-by-id [document] "target")))

(defun update-ui ()
    (when (= 0 (mod *frame-count* 30)) (update-ui-logic))
    (incf *frame-count*))