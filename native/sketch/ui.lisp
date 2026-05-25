(defvar *frame-count* 0)
(defvar *ui-text* "")

(defun update-ui-logic () 
  (let ((particle-count (count-if #'identity *particles*)))
    (setf *ui-text* 
          (format nil "X: ~A | Y: ~A | Particles: ~A" (round *mouseX*) (round *mouseY*) particle-count))))

(defun initialize-ui ()
  ; No-op on native for now
  nil)

(defun update-ui ()
    (when (= 0 (mod *frame-count* 30)) (update-ui-logic))
    (incf *frame-count*)
    ; On native, we draw the UI text directly
    (draw-text *ui-text* 10 (- *height* 30) 20 #xFFFFFFFF))
