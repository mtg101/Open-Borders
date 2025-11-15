; timining-critical flipping of top border colours
; 224 t-states per row
TOP_BORDER_RENDER:		

; 15 OUTS at 12 ts each = 180
; leaves 44 mostly hblank to make 224
; so 11 NOPs

; row 1 / 56    
TOP_BORDER_RENDER_ROW_1:		
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
TOP_BORDER_RENDER_ROW_2:
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
TOP_BORDER_RENDER_ROW_3:
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
TOP_BORDER_RENDER_ROW_4:
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
TOP_BORDER_RENDER_ROW_5:
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
TOP_BORDER_RENDER_ROW_6:
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
TOP_BORDER_RENDER_ROW_7:
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
TOP_BORDER_RENDER_ROW_8:
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

; row 9 / 56    
TOP_BORDER_RENDER_ROW_9:
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
    
; row 10 / 56    
TOP_BORDER_RENDER_ROW_10:
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
    
; row 11 / 56    
TOP_BORDER_RENDER_ROW_11:
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
    
; row 12 / 56    
TOP_BORDER_RENDER_ROW_12:
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
    
; row 13 / 56    
TOP_BORDER_RENDER_ROW_13:
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
    
; row 14 / 56    
TOP_BORDER_RENDER_ROW_14:
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
    
; row 15 / 56    
TOP_BORDER_RENDER_ROW_15:
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
    
; row 16 / 56    
TOP_BORDER_RENDER_ROW_16:
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

; row 17 / 56    
TOP_BORDER_RENDER_ROW_17:
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
    
; row 18 / 56    
TOP_BORDER_RENDER_ROW_18:
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
    
; row 19 / 56    
TOP_BORDER_RENDER_ROW_19:
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
    
; row 20 / 56    
TOP_BORDER_RENDER_ROW_20:
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
    
; row 21 / 56    
TOP_BORDER_RENDER_ROW_21:
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
    
; row 22 / 56    
TOP_BORDER_RENDER_ROW_22:
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
    
; row 23 / 56    
TOP_BORDER_RENDER_ROW_23:
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
    
; row 24 / 56    
TOP_BORDER_RENDER_ROW_24:
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

; row 25 / 56    
TOP_BORDER_RENDER_ROW_25:
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
    
; row 26 / 56    
TOP_BORDER_RENDER_ROW_26:
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
    
; row 27 / 56    
TOP_BORDER_RENDER_ROW_27:
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
    
; row 28 / 56    
TOP_BORDER_RENDER_ROW_28:
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
    
; row 29 / 56    
TOP_BORDER_RENDER_ROW_29:
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
    
; row 30 / 56    
TOP_BORDER_RENDER_ROW_30:
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
    
; row 31 / 56    
TOP_BORDER_RENDER_ROW_31:
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
    
; row 32 / 56    
TOP_BORDER_RENDER_ROW_32:
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

; row 33 / 56    
TOP_BORDER_RENDER_ROW_33:
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
    
; row 34 / 56    
TOP_BORDER_RENDER_ROW_34:
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
    
; row 35 / 56    
TOP_BORDER_RENDER_ROW_35:
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
    
; row 36 / 56    
TOP_BORDER_RENDER_ROW_36:
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
    
; row 37 / 56    
TOP_BORDER_RENDER_ROW_37:
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
    
; row 38 / 56    
TOP_BORDER_RENDER_ROW_38:
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
    
; row 39 / 56    
TOP_BORDER_RENDER_ROW_39:
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
    
; row 40 / 56    
TOP_BORDER_RENDER_ROW_40:
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

; row 41 / 56    
TOP_BORDER_RENDER_ROW_41:
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
    
; row 42 / 56    
TOP_BORDER_RENDER_ROW_42:
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
    
; row 43 / 56    
TOP_BORDER_RENDER_ROW_43:
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
    
; row 44 / 56    
TOP_BORDER_RENDER_ROW_44:
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
    
; row 45 / 56    
TOP_BORDER_RENDER_ROW_45:
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
    
; row 46 / 56    
TOP_BORDER_RENDER_ROW_46:
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
    
; row 47 / 56    
TOP_BORDER_RENDER_ROW_47:
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
    
; row 48 / 56    
TOP_BORDER_RENDER_ROW_48:
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

; row 49 / 56    
TOP_BORDER_RENDER_ROW_49:
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
    
; row 50 / 56    
TOP_BORDER_RENDER_ROW_50:
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
    
; row 51 / 56    
TOP_BORDER_RENDER_ROW_51:
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
    
; row 52 / 56    
TOP_BORDER_RENDER_ROW_52:
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
    
; row 53 / 56    
TOP_BORDER_RENDER_ROW_53:
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
    
; row 54 / 56    
TOP_BORDER_RENDER_ROW_54:
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
    
; row 55 / 56    
TOP_BORDER_RENDER_ROW_55:
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
    
; row 56 / 56    
TOP_BORDER_RENDER_ROW_56:
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
;    .11 nop        ; no need on last row
                    ; and need time to make border nack to black

    PUSH    AF
    LD      A, COL_BLK
    OUT     (C), A  ; set back to black
    POP     AF 

	ret								; TOP_BORDER_RENDER

; self-modify registers used in render based on buffer
RENDER_SMC:
    PUSH        AF
    PUSH        BC
    PUSH        DE

    PUSH        HL

    LD          B, 40                   ; 56 rows
    LD          DE, TOP_BORDER_RENDER_ROW_1 ; start of code to modify

RENDER_SMC_ROW_LOOP:
    PUSH        BC                      ; for inner loop

    LD          B, 15                   ; loop 15 times
    INC         DE                      ; step over OUT (ED) opcode
    LD          IX, RENDER_BUFFER_ROWS  ; slow but worry later... 

RENDER_SMC_STRIPE_LOOP:
    LD          HL, BUFFER_REGISTER_LUT
    PUSH        BC
    PUSH        AF

    LD          A, (IX)                 ; load which reg
    INC         IX                      ; move to next
    LD          B, 0                    ; BC needed
    LD          C, A                    ; actual value to add
    ADD         HL, BC                  ; add offset

    POP         AF
    POP         BC
    LD          A, (HL)
    LD          (DE), A               
    INC         DE                      ; step over operand
    INC         DE                      ; step over opcode
    DJNZ        RENDER_SMC_STRIPE_LOOP

    .10 INC     DE                      ; 11 nops, but one opcode from loop not needed

    POP         BC                      ; for inner loop
    DJNZ        RENDER_SMC_ROW_LOOP     ; RENDER_SMC_ROW_LOOP

    POP         HL
    POP         DE
    POP         BC 
    POP         AF

    RET                 ; RENDER_SMC


BUFFER_REGISTER_LUT:
    DEFB        $79     ; A
    DEFB        $41     ; B
    DEFB        $51     ; D
    DEFB        $59     ; E
    DEFB        $61     ; H
    DEFB        $69     ; L


