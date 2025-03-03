(define (pack-sprites image spriteWidth spriteHeight cols )
(let* (
    (layers (vector->list(cadr(gimp-image-get-layers image))))
    (layersCount (car(gimp-image-get-layers image)))
    )
    (gimp-image-resize image (* spriteWidth cols) (* spriteHeight (inexact->exact (ceiling (/ layersCount cols)))) 0 0)
    (let loop ((i 0 ))  ; loop through layers
    (if (< i layersCount)
    (begin
    (let* (
        (offx (* spriteWidth (modulo i cols)))
        (offy (* spriteHeight (inexact->exact (floor (/ i cols)))))
        (layer (if (pair? layers) (car layers) layers))
        )
        (gimp-layer-set-offsets layer offx offy)  ; displacing them into a grid arrangement
        (set! layers (if (pair? layers) (cdr layers) layers) ) )
    (loop (+ i 1) ) ) ) )
) )

(script-fu-register
    "pack-sprites"
    "<Image>/Tools/pack sprites"
    "pack layers into spritesheet"
    "plugnpi"
    ""
    "March 2025"
    ""
    SF-IMAGE    "image" 0
    SF-VALUE    "spriteWidth"  ""
    SF-VALUE    "spriteHeight"  ""
    SF-VALUE    "cols"  ""
)
