


; scrolls buffer to the left
BUFFER_SCROLL:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          B, 8                ; 8 rows (just for pixels, get made taller during render)
    LD          DE, PIXEL_BUFFER_ROWS     ; start of buffer to copy to
    LD          HL, PIXEL_BUFFER_ROWS + 1 ; offset buffer to copy from
BUFFER_SCROLL_LOOP:
    PUSH        BC
    ; 19 LDIs for the whole row
    .19 LDI

    ; step over to next row
    INC         HL
    INC         DE

    POP         BC
    DJNZ        BUFFER_SCROLL_LOOP

    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                             ; BUFFER_SCROLL

; adds next char to the buffer if needed
BUFFER_QUEUE_CHAR:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          A, (BUFFER_FRAME)
    AND         %00000011
    JP          NZ, BUFFER_DONE_CHAR    ; skip if it's not frame 00

    LD          HL, (BUFFER_MESSAGE_INDEX)  ; next char
    LD          A, (HL)                     ; get that char

    ; find the pixels
    LD          HL, OB_FONT_ASCII       ; base LUT
    SLA         A                       ; double ASCII value to move Words into LUT
    LD          D, 0                    ; zero it
    LD          E, A                    ; offset
    ADD         HL, DE                  ; HL now addr of pixels

    LD          E, (HL)                 ; load part of addr
    INC         HL                      ; step
    LD          D, (HL)                 ; load other part of addr

    EX          DE, HL                  ; make hl point at char pixels



    ; render the char pixels into the buffer

    ; row 1
    LD          DE, PIXEL_BUFFER_ROWS + 16  ; last 4 bytes of the row
    .4 LDI                                  ; copy the 4 bytes

    ; row 2
    LD          DE, PIXEL_BUFFER_ROWS + 20 + 16  
    .4 LDI                                  ; copy the 4 bytes

    ; row 3
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 2) + 16  
    .4 LDI                                  ; copy the 4 bytes

    ; row 4
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 3) + 16  
    .4 LDI                                  ; copy the 4 bytes

    ; row 5
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 4) + 16  
    .4 LDI                                  ; copy the 4 bytes

    ; row 6
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 5) + 16  
    .4 LDI                                  ; copy the 4 bytes

    ; row 7
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 6) + 16  
    .4 LDI                                  ; copy the 4 bytes

    ; row 8
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 7) + 16  
    .4 LDI                                  ; copy the 4 bytes

    LD          HL, (BUFFER_MESSAGE_INDEX)  ; reload index
    INC         HL                      ; point to next char
    LD          A, (HL)                 ; load that next char
    CP          0                       ; check for null terminator
    JR          NZ, BUFFER_NEXT_CHAR

    LD          HL, BUFFER_MESSAGE      ; point to start of message

BUFFER_NEXT_CHAR:
    LD          (BUFFER_MESSAGE_INDEX), HL

BUFFER_DONE_CHAR:
    LD          A, (BUFFER_FRAME)
    INC         A
    LD          (BUFFER_FRAME), A

    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                             ; BUFFER_QUEUE


; renders pixel buffer to render buffer
BUFFER_RENDER:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          DE, RENDER_BUFFER_ROWS
    LD          IY, RENDER_BUFFER_TEMP_ROW

    ; course row 1/8
    LD          IX, PIXEL_BUFFER_ROWS
    CALL        BUFFER_LOAD_TEMP_ROW
    CALL        BUFFER_RENDER_7

    ; course row 2/8
    LD          IX, PIXEL_BUFFER_ROWS + 20
    CALL        BUFFER_LOAD_TEMP_ROW
    CALL        BUFFER_RENDER_7

    ; course row 3/8
    LD          IX, PIXEL_BUFFER_ROWS + (20 * 2)
    CALL        BUFFER_LOAD_TEMP_ROW
    CALL        BUFFER_RENDER_7

    ; course row 4/8
    LD          IX, PIXEL_BUFFER_ROWS + (20 * 3)
    CALL        BUFFER_LOAD_TEMP_ROW
    CALL        BUFFER_RENDER_7

    ; course row 5/8
    LD          IX, PIXEL_BUFFER_ROWS + (20 * 4)
    CALL        BUFFER_LOAD_TEMP_ROW
    CALL        BUFFER_RENDER_7

    ; course row 6/8
    LD          IX, PIXEL_BUFFER_ROWS + (20 * 5)
    CALL        BUFFER_LOAD_TEMP_ROW
    CALL        BUFFER_RENDER_7

    ; course row 7/8
    LD          IX, PIXEL_BUFFER_ROWS + (20 * 6)
    CALL        BUFFER_LOAD_TEMP_ROW
    CALL        BUFFER_RENDER_7

    ; course row 8/8
    LD          IX, PIXEL_BUFFER_ROWS + (20 * 7)
    CALL        BUFFER_LOAD_TEMP_ROW
    CALL        BUFFER_RENDER_7


    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                             ; BUFFER_RENDER

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

BUFFER_MESSAGE:
    DEFB        " OPEN BORDERS        "
    DEFB        " OPEN MINDS        "
    DEFB        0

BUFFER_MESSAGE_INDEX:
    DEFW        BUFFER_MESSAGE

; 15 cols, each char is 4 wide, so 4 can show
; need 5th for offscreen buffer
; so 5 chars, each 4 wide
; = 20 bytes per row
; x 8 rows 
; = 160 bytes
PIXEL_BUFFER_ROWS:
    DEFS    160

; render buffer for actual border
; stores the register values to SMC
; 56 row of course
; 15 wide as that's how many stripes can display
; 56 * 15 = 840
RENDER_BUFFER_ROWS:
    DEFS    840

RENDER_BUFFER_TEMP_ROW:
    DEFS    15

BUFFER_REGISTER_LUT:
    DEFB        $79     ; A
    DEFB        $41     ; B
    DEFB        $51     ; D
    DEFB        $59     ; E
    DEFB        $61     ; H
    DEFB        $69     ; L




