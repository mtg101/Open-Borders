


; timining-critical flipping of top border colours
; 224 t-states per row
TOP_BORDER_RENDER:		

; 15 OUTS at 12 ts each = 180
; leaves 44 mostly hblank to make 224
; so 11 NOPs

; row 1 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    .11 nop
    
; row 2 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    .11 nop
    
; row 3 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    .11 nop
    
; row 4 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    .11 nop
    
; row 5 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    .11 nop
    
; row 6 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    .11 nop
    
; row 7 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    .11 nop
    
; row 8 / 56    
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    OUT (C), E
    OUT (C), H
    OUT (C), L
    OUT (C), A
    OUT (C), B
    OUT (C), D
    .11 nop

; set back to black
    OUT     (C), L
	ret								; TOP_BORDER_RENDER



