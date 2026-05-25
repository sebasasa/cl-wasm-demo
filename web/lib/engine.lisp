;; --- 1. Base Working Core ---
(define-js-variable ([document] :js-expr "document" :type :symbol))
(define-js-variable ([window] :js-expr "window" :type :symbol))

(define-js-method (js-get-element-by-id :js-expr "getElementById" :type :js-ref)
    ((self :js-ref) 
     (id :string)))

(define-js-accessor (inner-html :js-expr "innerHTML" :type :string)
    ((self :js-ref) 
     (html :string)))

(define-js-method (js-add-event-listener :js-expr "addEventListener" :type :null)
    ((self :js-ref)
     (event-name :string)
     (callback-fun :js-ref)))

(define-js-getter (get-client-x :js-expr "clientX" :type :fixnum)
    ((self :js-ref)))

(define-js-getter (get-client-y :js-expr "clientY" :type :fixnum)
    ((self :js-ref)))

;; --- 2. WECL Explicit Canvas Context & Method Extensions ---
(define-js-method (canvas-get-context :js-expr "getContext" :type :js-ref)
    ((self :js-ref) 
     (context-type :string)))

;; --- 3. Animation Loop Extension ---
(define-js-method (js-request-animation-frame :js-expr "requestAnimationFrame" :type :null)
    ((self :js-ref)
     (callback-fun :js-ref)))

(define-js-method (js-set-interval :js-expr "setInterval" :type :fixnum)
    ((self :js-ref)
     (callback-fun :js-ref)
     (ms :fixnum)))


(define-js-accessor (component-width :js-expr "width" :type :fixnum)
    ((self :js-ref) 
     (width :fixnum))) 

(define-js-accessor (component-height :js-expr "height" :type :fixnum)
    ((self :js-ref) 
     (width :fixnum))) 



;; --- 4. Global State Tracking (Processing Variables) ---
(defvar *mousex* 0)
(defvar *mousey* 0)
(defvar *ctx* nil)


(defun initialize-mouse () 
  (js-add-event-listener [window] "mousemove"
                        (lambda-js-callback :null ((event :js-ref))
                           (setf *mousex* (get-client-x event))
                           (setf *mousey* (get-client-y event))))
                           )

(defvar *width* 0) 
(defvar *height* 0) 

(defun create_canvas (w h id)
  (initialize-mouse)
  (let ((canvas-obj (js-get-element-by-id [document] id)))
    (setf *ctx* (canvas-get-context canvas-obj "2d"))
    (setf *width* w)
    (setf *height* h )
    (setf (component-width canvas-obj) w)
    (setf (component-height canvas-obj) h)
    )
)

