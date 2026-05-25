
; To create a binding to a function of the form obj.method() you have to do: 

; (define-js-method (method :js-expr "method" :type {return type})
;   ((self :js-ref) {Inputs go here, })
; )

; And now can call it as (method obj) or (method obj input)

; If you on the other hand want to be able to change a property you do 

; (define-js-accessor (component-height :js-expr "height" :type :fixnum)
;     ((self :js-ref) 
;      (width :fixnum))) 

; and you call that like (component-height canvas-element) or (setf (component-height canvas-element) 100)


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


(define-js-method (canvas-clear-rect :js-expr "clearRect" :type :null) 
  ((self :js-ref)
  (x :fixnum) (y :fixnum) (w :fixnum) (h :fixnum)))



; Now, using those functions, we create the actual library

(defun clearRect (x y w h)
  (canvas-clear-rect *ctx* x y w h)
) 

(defun rect (x y w h)
  (canvas-rect *ctx* x y w h))

(defun ellipse (x y w h)
  (canvas-ellipse *ctx* x y w h))

(defun getColor (hex)
  (format nil "#~8,'0X" hex))

; This one is to set color from hex string
(defun set-fill (color)
  (setf (canvas-fill-style *ctx*) color))

;This one is to set color from hex number
;Seems like fill is already defined...
(defun fillCol (num)
  (set-fill (getColor num)))


(defun background (col) 
  (clearRect 0 0 *WIDTH* *HEIGHT*)
  (fillCol col)
  (rect 0 0 *WIDTH* *HEIGHT*)
)
