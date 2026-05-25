/**
 * lib/bindings.js
 * 
 * This file serves as a middleman for the Lisp-to-JS bridge.
 * It provides Processing-style helpers for the Canvas API to simplify 
 * the Common Lisp bindings.
 */

(function() {
    if (typeof CanvasRenderingContext2D !== 'undefined') {
        
        // Quicle-style ellipse: ellipse(x, y, width, height)
        CanvasRenderingContext2D.prototype.ellipse_quicle = function(x, y, w, h) {
            this.beginPath();
            this.ellipse(x, y, Math.abs(w / 2), Math.abs(h / 2), 0, 0, 2 * Math.PI);
            this.fill();
        };

        // Quicle-style rect: rect(x, y, width, height)
        CanvasRenderingContext2D.prototype.rect_quicle = function(x, y, w, h) {
            this.fillRect(x, y, w, h);
        };
    }
})();
