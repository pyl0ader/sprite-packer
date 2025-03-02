(define (pack-sprites image spriteWidth spriteHeight cols )
(let* (
    (layers (vector->list(cadr(gimp-image-get-layers image))))
    (layersCount (car(gimp-image-get-layers image)))
    )
    ; TODO resize canvas
    (gimp-message "A")
    (let loop ((i 0 ))  ; loop through layers
    (if (< i layersCount))
    (begin
    (let* (
        (offx (* spriteWidth (modulo i cols)))
        (offy (* spriteHeight (floor (/ i cols))))
        (layer (car layers))
        (set! layers (cdr layers))
        )
        (gimp-message "B")
        (gimp-layer-translate layer offx offy)  ; displacing them into a grid arrangement
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
