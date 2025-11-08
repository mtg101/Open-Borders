; timining-critical flipping of top border colours
; 224 t-states per row
TOP_BORDER_RENDER:		

; 15 OUTS at 12 ts each = 180
; leaves 44 mostly hblank to make 224
; so 11 NOPs

; row 1 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 2 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 3 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 4 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 5 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 6 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 7 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 8 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop

; row 9 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 10 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 11 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 12 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 13 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 14 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 15 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 16 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop

; row 17 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 18 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 19 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 20 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 21 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 22 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 23 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 24 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop

; row 25 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 26 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 27 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 28 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 29 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 30 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 31 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 32 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop

; row 33 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 34 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 35 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 36 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 37 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 38 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 39 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 40 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop

; row 41 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 42 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 43 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 44 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 45 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 46 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 47 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 48 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop

; row 49 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 50 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 51 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 52 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 53 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 54 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 55 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop
    
; row 56 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), C
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    .11 nop

; set back to black
    OUT     (C), L
	ret								; TOP_BORDER_RENDER



