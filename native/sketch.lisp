;; sketch.lisp
(defun setup ()
  (init-window 800 450 "Quicle Sketch"))

(defvar mx 0.0)
(defvar my 0.0)

(defun draw ()
  (setf mx get-mouse-x)
  (setf my get-mouse-y)
  (begin-drawing)
  (clear-background #xFAFAFAFF) ;; RAYWHITE
  (end-drawing))