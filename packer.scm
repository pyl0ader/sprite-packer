(define (pack-sprites image
(let* (
    (spriteWidth 750)
    (spriteHeight 1026)
    (cols 5)
    (layers (vector->list(cadr(gimp-image-get-layers image))))
    (layersCount (car(gimp-image-get-layers image)))
    )
    (gimp-message "A")
    (let loop ((i 0 ))
    (if (< i layersCount))
    (begin
    (let* (
        (offx (* spriteWidth (modulo i cols)))
        (offy (* spriteHeight (floor (/ i cols))))
        (layer (car layers))
        (set! layers (cdr layers))
        )
        (gimp-layer-translate layer offx offy)
    (loop (+ i 1) ) ) ) )
) ) )

(script-fu-register
    "pack-sprites"
    "<Image>/Tools/pack sprites"
    "pack layers into spritesheet"
    "plugnpi"
    ""
    "March 2025"
    ""
    SF-IMAGE    "image" 0
)
