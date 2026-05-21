(setup)

(labels ((run-loop ()
           (draw)
           ;; Request the next frame cleanly
           (js-request-animation-frame [window] 
                                       (lambda-js-callback :null ((timestamp :js-ref))
                                         (run-loop)))))
  ;; Start the loop
  (run-loop))
