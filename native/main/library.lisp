; This is where we use the raylib functions to define the quicle functions
(defvar *width* 0)
(defvar *height* 0)

(defun create_canvas (w h name) 
  (init-window w h name) 
  (init-global-canvas w h) ; For more info on what the canvas even is, check @bootstrap.lisp
  (set-target-fps 60)
  (setf *width* w)
  (setf *height* h)
  )

(defvar *fill-color* #xFFFFFFFF)

(defun fillCol (color)
  (setf *fill-color* color))

(defun background (color)
  (clear-background color)
)

(defun rect (x y w h)
  (draw-rectangle x y w h *fill-color*))

(defun ellipse (x y w h)
  (draw-ellipse x y (float (/ w 2)) (float (/ h 2)) *fill-color*))

; Handle the mosue 
; We call the update function on the mainloop

(defvar *mousex* 0.0)
(defvar *mousey* 0.0)

(defun update-mouse () 
  (setf *mousex* (get-mouse-x))
  (setf *mousey* (get-mouse-y))
)