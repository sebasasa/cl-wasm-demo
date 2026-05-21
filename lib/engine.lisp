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

(define-js-method (canvas-fill-rect :js-expr "fillRect" :type :null)
    ((self :js-ref) 
     (x :fixnum) (y :fixnum) (w :fixnum) (h :fixnum)))

;; --- 3. Animation Loop Extension ---
(define-js-method (js-request-animation-frame :js-expr "requestAnimationFrame" :type :null)
    ((self :js-ref)
     (callback-fun :js-ref)))

;; --- 4. Global State Tracking (Processing Variables) ---
(defvar *mx* 0)
(defvar *my* 0)
(defvar *ctx* nil)
(defvar *my-div* nil)