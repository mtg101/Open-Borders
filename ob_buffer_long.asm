
; DE is col offset
BUFFER_RENDER_COL:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          HL, RENDER_BUFFER_ROW_1
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_2
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 1
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_3
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 2
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_4
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 3
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_5
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 4
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_6
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 5
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_7
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 6
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_8
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 7
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_9
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 8
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_10
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 9
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_11
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 10
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_12
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 11
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_13
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 12
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_14
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 13
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_15
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 14
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_16
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 15
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_17
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 16
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_18
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 17
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_19
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 18
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_20
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 19
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_21
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 20
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_22
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 21
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_23
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 22
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_24
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 23
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_25
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 24
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_26
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 25
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_27
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 26
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_28
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 27
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_29
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 28
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_30
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 29
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_31
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 30
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_32
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 31
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_33
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 32
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_34
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 33
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_35
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 34
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_36
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 35
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_37
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 36
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_38
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 37
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_39
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 38
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_40
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 39
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_41
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 40
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_42
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 41
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_43
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 42
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_44
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 43
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_45
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 44
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_46
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 45
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_47
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 46
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_48
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 47
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_49
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 48
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_50
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 49
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_51
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 50
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_52
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 51
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_53
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 52
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_54
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 53
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_55
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 54
    LD          A, (BC)
    LD          (HL), A

    LD          HL, RENDER_BUFFER_ROW_56
    ADD         HL, DE
    LD          BC, RENDER_BUFFER_TEMP_COL + 55
    LD          A, (BC)
    LD          (HL), A


    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                                     ; BUFFER_RENDER_COL



BUFFER_RENDER_7:
    ; render RENDER_BUFFER_TEMP_ROW 7 times
    LD          HL, RENDER_BUFFER_TEMP_ROW  ; reset source
    .15 LDI                                 ; all 15 visible bars - row 1/7

    LD          HL, RENDER_BUFFER_TEMP_ROW  ; reset source
    .15 LDI                                 ; all 15 visible bars - row 2/7

    LD          HL, RENDER_BUFFER_TEMP_ROW  ; reset source
    .15 LDI                                 ; all 15 visible bars - row 3/7

    LD          HL, RENDER_BUFFER_TEMP_ROW  ; reset source
    .15 LDI                                 ; all 15 visible bars - row 4/7

    LD          HL, RENDER_BUFFER_TEMP_ROW  ; reset source
    .15 LDI                                 ; all 15 visible bars - row 5/7

    LD          HL, RENDER_BUFFER_TEMP_ROW  ; reset source
    .15 LDI                                 ; all 15 visible bars - row 6/7

    LD          HL, RENDER_BUFFER_TEMP_ROW  ; reset source
    .15 LDI                                 ; all 15 visible bars - row 7/7

    RET                                     ; BUFFER_RENDER_7


BUFFER_LOAD_TEMP_ROW:
    ; convert pixels into registers and store in...
    ; RENDER_BUFFER_TEMP_ROW
    LD          B, 0                        ; needed for 16bit ADD

    ; convert pixel to register 1/15
    LD          A, (IX)                     ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY), A                     ; register into temp buf

    ; convert pixel to register 2/15
    LD          A, (IX+1)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+1), A                   ; register into temp buf

    ; convert pixel to register 3/15
    LD          A, (IX+2)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+2), A                   ; register into temp buf

    ; convert pixel to register 4/15
    LD          A, (IX+3)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+3), A                   ; register into temp buf

    ; convert pixel to register 5/15
    LD          A, (IX+4)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+4), A                   ; register into temp buf

    ; convert pixel to register 6/15
    LD          A, (IX+5)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+5), A                   ; register into temp buf

    ; convert pixel to register 7/15
    LD          A, (IX+6)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+6), A                   ; register into temp buf

    ; convert pixel to register 8/15
    LD          A, (IX+7)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+7), A                   ; register into temp buf

    ; convert pixel to register 9/15
    LD          A, (IX+8)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+8), A                   ; register into temp buf

    ; convert pixel to register 10/15
    LD          A, (IX+9)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+9), A                   ; register into temp buf

    ; convert pixel to register 11/15
    LD          A, (IX+10)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+10), A                   ; register into temp buf

    ; convert pixel to register 12/15
    LD          A, (IX+11)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+11), A                   ; register into temp buf

    ; convert pixel to register 13/15
    LD          A, (IX+12)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+12), A                   ; register into temp buf

    ; convert pixel to register 14/15
    LD          A, (IX+13)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+13), A                   ; register into temp buf

    ; convert pixel to register 15/15
    LD          A, (IX+14)                   ; pixel in A
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg
    LD          (IY+14), A                   ; register into temp buf

    RET                                     ; BUFFER_LOAD_TEMP_ROW


BUFFER_FRAME:
    DEFB        0

; 15 cols, each char is 4 wide, so 4 can show
; need 5th for offscreen buffer
; so 5 chars, each 4 wide
; = 20 bytes per row
; x 8 rows 
; = 160 bytes
PIXEL_BUFFER_ROWS:
PIXEL_BUFFER_ROW_1:
    DEFS    20
PIXEL_BUFFER_ROW_2:
    DEFS    20
PIXEL_BUFFER_ROW_3:
    DEFS    20
PIXEL_BUFFER_ROW_4:
    DEFS    20
PIXEL_BUFFER_ROW_5:
    DEFS    20
PIXEL_BUFFER_ROW_6:
    DEFS    20
PIXEL_BUFFER_ROW_7:
    DEFS    20
PIXEL_BUFFER_ROW_8:
    DEFS    20

; render buffer for actual border
; stores the register values to SMC
; 56 row of course
; 15 wide as that's how many stripes can display
; 56 * 15 = 840
; all $71 for OUT (C), 0
RENDER_BUFFER_ROWS:
RENDER_BUFFER_ROW_1:
    DEFS    15, $71
RENDER_BUFFER_ROW_2:
    DEFS    15, $71
RENDER_BUFFER_ROW_3:
    DEFS    15, $71
RENDER_BUFFER_ROW_4:
    DEFS    15, $71
RENDER_BUFFER_ROW_5:
    DEFS    15, $71
RENDER_BUFFER_ROW_6:
    DEFS    15, $71
RENDER_BUFFER_ROW_7:
    DEFS    15, $71
RENDER_BUFFER_ROW_8:
    DEFS    15, $71
RENDER_BUFFER_ROW_9:
    DEFS    15, $71
RENDER_BUFFER_ROW_10:
    DEFS    15, $71
RENDER_BUFFER_ROW_11:
    DEFS    15, $71
RENDER_BUFFER_ROW_12:
    DEFS    15, $71
RENDER_BUFFER_ROW_13:
    DEFS    15, $71
RENDER_BUFFER_ROW_14:
    DEFS    15, $71
RENDER_BUFFER_ROW_15:
    DEFS    15, $71
RENDER_BUFFER_ROW_16:
    DEFS    15, $71
RENDER_BUFFER_ROW_17:
    DEFS    15, $71
RENDER_BUFFER_ROW_18:
    DEFS    15, $71
RENDER_BUFFER_ROW_19:
    DEFS    15, $71
RENDER_BUFFER_ROW_20:
    DEFS    15, $71
RENDER_BUFFER_ROW_21:
    DEFS    15, $71
RENDER_BUFFER_ROW_22:
    DEFS    15, $71
RENDER_BUFFER_ROW_23:
    DEFS    15, $71
RENDER_BUFFER_ROW_24:
    DEFS    15, $71
RENDER_BUFFER_ROW_25:
    DEFS    15, $71
RENDER_BUFFER_ROW_26:
    DEFS    15, $71
RENDER_BUFFER_ROW_27:
    DEFS    15, $71
RENDER_BUFFER_ROW_28:
    DEFS    15, $71
RENDER_BUFFER_ROW_29:
    DEFS    15, $71
RENDER_BUFFER_ROW_30:
    DEFS    15, $71
RENDER_BUFFER_ROW_31:
    DEFS    15, $71
RENDER_BUFFER_ROW_32:
    DEFS    15, $71
RENDER_BUFFER_ROW_33:
    DEFS    15, $71
RENDER_BUFFER_ROW_34:
    DEFS    15, $71
RENDER_BUFFER_ROW_35:
    DEFS    15, $71
RENDER_BUFFER_ROW_36:
    DEFS    15, $71
RENDER_BUFFER_ROW_37:
    DEFS    15, $71
RENDER_BUFFER_ROW_38:
    DEFS    15, $71
RENDER_BUFFER_ROW_39:
    DEFS    15, $71
RENDER_BUFFER_ROW_40:
    DEFS    15, $71
RENDER_BUFFER_ROW_41:
    DEFS    15, $71
RENDER_BUFFER_ROW_42:
    DEFS    15, $71
RENDER_BUFFER_ROW_43:
    DEFS    15, $71
RENDER_BUFFER_ROW_44:
    DEFS    15, $71
RENDER_BUFFER_ROW_45:
    DEFS    15, $71
RENDER_BUFFER_ROW_46:
    DEFS    15, $71
RENDER_BUFFER_ROW_47:
    DEFS    15, $71
RENDER_BUFFER_ROW_48:
    DEFS    15, $71
RENDER_BUFFER_ROW_49:
    DEFS    15, $71
RENDER_BUFFER_ROW_50:
    DEFS    15, $71
RENDER_BUFFER_ROW_51:
    DEFS    15, $71
RENDER_BUFFER_ROW_52:
    DEFS    15, $71
RENDER_BUFFER_ROW_53:
    DEFS    15, $71
RENDER_BUFFER_ROW_54:
    DEFS    15, $71
RENDER_BUFFER_ROW_55:
    DEFS    15, $71
RENDER_BUFFER_ROW_56:
    DEFS    15, $71

; never used together, so share same mem
RENDER_BUFFER_TEMP_ROW: ; 15
RENDER_BUFFER_TEMP_COL: ; 56
    DEFS    56

BUFFER_REGISTER_LUT:
    DEFB        $71     ; 0 (black)
    DEFB        $79     ; A
    DEFB        $41     ; B
    DEFB        $51     ; D
    DEFB        $59     ; E
    DEFB        $61     ; H
    DEFB        $49     ; C (yellow, but also noise...)
    DEFB        $69     ; L

BUFFER_REGISTER_GLITCH: ; also 8th index of RENDER_BUFFER_TEMP_ROW
    DEFB        $CD     ; glitch (bad timing, needs chars to work with to glitch)

SINE_FRAME:
    DEFB        0

PIXEL_BUF_PTR:
    DEFW        0

SINE_STATE:
    DEFB        0
