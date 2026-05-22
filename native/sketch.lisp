;; sketch.lisp
(defun setup ()
  (init-window 800 450 "Quicle Sketch"))

(defun draw ()
  (begin-drawing)
  (clear-background #xFAFAFAFF) ;; RAYWHITE
  (end-drawing))