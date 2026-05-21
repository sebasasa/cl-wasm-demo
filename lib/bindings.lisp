;; --- Processing Bindings ---

(define-js-method (canvas-fill-rect :js-expr "fillRect" :type :null)
    ((self :js-ref) 
     (x :fixnum) (y :fixnum) (w :fixnum) (h :fixnum)))

(defun initialize_mouse () 
  (js-add-event-listener [window] "mousemove"
                        (lambda-js-callback :null ((event :js-ref))
                           (setf MOUSEX (get-client-x event))
                           (setf MOUSEY (get-client-y event)))
))


(defun initialize_canvas (id)
  (initialize_mouse)
  (let ((canvas-obj (js-get-element-by-id [document] id)))
    (setf *ctx* (canvas-get-context canvas-obj "2d")))
)


(defun rect (x y w h)
  (canvas-fill-rect *ctx* x y w h))
