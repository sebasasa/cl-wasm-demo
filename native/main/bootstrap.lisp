; Currently we MANUALLY load the user scripts
; This file should probably be generated programatically based on the contents of the manifest
; We could even do that directly with a simple bash script, even directly inside of build.sh

(load "sketch/sketch.lisp")

(defun run-engine ()
  (setup)
  (loop until (window-should-close-p) do
    (draw))
  (close-window))

(run-engine)