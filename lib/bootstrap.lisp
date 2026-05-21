(setup)

;; Use setInterval instead of requestAnimationFrame for a more stable loop 
;; when the browser console is open (prevents 'long task' warnings).
(js-set-interval [window] 
                 (lambda-js-callback :null ()
                   (draw))
                 16) ;; ~60 FPS
