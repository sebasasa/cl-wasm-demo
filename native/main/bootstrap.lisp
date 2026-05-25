; Manifest-based loader for native
(defun load-manifest ()
  (let* ((dir "sketch")
         (manifest-path (format nil "~A/quicle.manifest.json" dir))
         (files '())
         (entrypoint "sketch.lisp")
         (manifest-exists (probe-file manifest-path)))
    
    (if manifest-exists
        (progn
          (format t "Found manifest at ~A~%" manifest-path)
          ; Very crude JSON-ish parser for our specific manifest format
          (with-open-file (stream manifest-path)
            (loop for line = (read-line stream nil)
                  while line
                  do (cond 
                       ((search "\"entrypoint\":" line)
                        (setf entrypoint (string-trim " \"," (subseq line (+ (search ":" line) 1)))))
                       ((search ".lisp" line)
                        (push (string-trim " \"," (subseq line (search "\"" line))) files)))))
          
          (setf files (nreverse files))
          (setf files (remove entrypoint files :test #'string=))

          ; Load extra files from manifest
          (dolist (f files)
            (let ((path (format nil "~A/~A" dir f)))
              (format t "Loading ~A...~%" path)
              (load path))))
        
        ; Fallback: No manifest, just load sketch.lisp
        (progn
          (format t "No manifest found at ~A. Falling back to default sketch/sketch.lisp~%" manifest-path)
          (setf entrypoint "sketch.lisp")))
    
    ; Always load entrypoint
    (let ((path (format nil "~A/~A" dir entrypoint)))
      (format t "Loading entrypoint ~A...~%" path)
      (load path))))

(load-manifest)

(defun render-canvas () 
  (begin-drawing)
  (draw-canvas 0 0)
  (end-drawing)
  )

(defun run-engine ()
  (setup)
  (loop until (window-should-close-p) do
    (update-mouse)
    (begin-canvas)
    (draw)
    (end-canvas)
    (render-canvas)
    )
  (close-window))

(run-engine)