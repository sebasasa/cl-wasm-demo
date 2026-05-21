(setup)

;; We define the recurring frame tick using WECL's native callback macro
(labels ((run-loop ()
           (draw)
           ;; Request the next frame cleanly
           (js-request-animation-frame [window] 
                                       (lambda-js-callback :null ((timestamp :js-ref))
                                         (run-loop)))))
  ;; Start the loop
  (run-loop))
