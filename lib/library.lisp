;; --- Quicle Canvas Bindings ---

(define-js-method (canvas-rect :js-expr "rect_quicle" :type :null)
    ((self :js-ref) 
     (x :fixnum) (y :fixnum) (w :fixnum) (h :fixnum)))

(define-js-method (canvas-ellipse :js-expr "ellipse_quicle" :type :null)
    ((self :js-ref) 
     (x :fixnum) (y :fixnum) (w :fixnum) (h :fixnum)))

(define-js-accessor (canvas-fill-style :js-expr "fillStyle" :type :string)
    ((self :js-ref)
     (style :string)))

(defun rect (x y w h)
  (canvas-rect *ctx* x y w h))

(defun ellipse (x y w h)
  (canvas-ellipse *ctx* x y w h))

(defun set-fill (color)
  (setf (canvas-fill-style *ctx*) color))
