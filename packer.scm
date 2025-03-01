(define pack-sprites
(let* (
    (cols 5)
    (rows 3)
    (i 0)
    (n 14)
    (image (gimp-image-list))
    (layers (gimp-image-get-layers 3))
    )
    (while (< i n)
        (offx (* 750 (% i 5)))
        (offy (* 1026 (floor (/ i 5))))
        (gimp-layer-translate layers offx offy)
        (set! layers (cdr layers))
        (+ i 1)
    )
)
)

(script-fu-register
    "pack-sprites"
    "<Image>/Tools/pack sprites"
    "pack layers into spritesheet"
    "plugnpi"
    "plugnpi"
    "March 2025"
    "RGB*, GRAY*"
)
