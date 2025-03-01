(define (pack-sprites
(let* (
    (cols 5)
    (sprite_width 750)
    (sprite_height 1026)
    (image (car(vector->list(cadr(gimp-image-list)))))
    (layers (vector->list(cadr(gimp-image-get-layers image))))
    )
    (let loop ((i 0 ))
    (if (< i 14))
    (begin
    (let* (
        (offx (* sprite_width (modulo i cols)))
        (offy (* sprite_height (floor (/ i cols))))
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
    "plugnpi"
    "March 2025"
    "RGB*, GRAY*"
)
