;; sketch.lisp

(defun setup ()
  (init-window 800 450 "My Lisp Sketch"))

(defun draw ()
  (begin-drawing)
  (clear-background #xFAFAFAFF) ;; RAYWHITE
  (end-drawing))