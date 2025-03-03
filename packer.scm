(define (pack-sprites image spriteWidth spriteHeight cols )
(let* (
    (layers (vector->list(cadr(gimp-image-get-layers image))))
    (layersCount (car(gimp-image-get-layers image)))
    )
    ; TODO resize canvas
    (gimp-message "Layers: ")
    (gimp-message (number->string layersCount))
    (let loop ((i 0 ))  ; loop through layers
    (if (< i layersCount))
    (begin
    (let* (
        (offx (* spriteWidth (modulo i cols)))
        (offy (* spriteHeight (floor (/ i cols))))
        (layer (if (pair? layers) (car layers) layers))
        )
        (gimp-message "i: ")
        (gimp-message (number->string i))
        (gimp-layer-translate layer offx offy)  ; displacing them into a grid arrangement
        (set! layers (if (pair? layers) (cdr layers) layers) )
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
