;; --- Processing Bindings ---

(define-js-method (canvas-fill-rect :js-expr "fillRect" :type :null)
    ((self :js-ref) 
     (x :fixnum) (y :fixnum) (w :fixnum) (h :fixnum)))

(define-js-accessor (canvas-fill-style :js-expr "fillStyle" :type :string)
    ((self :js-ref)
     (style :string)))

(defun rect (x y w h)
  (canvas-fill-rect *ctx* x y w h))

(defun set-fill (color)
  (setf (canvas-fill-style *ctx*) color))
