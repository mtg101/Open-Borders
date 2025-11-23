


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

    ; find the fx / colour
    LD          HL, BUFFER_MESSAGE_META ; start of fx buffer
    LD          DE, (BUFFER_MESSAGE_OFFSET)   ; offset
    ADD         HL, DE                  ; add offset
    LD          B, (HL)                 ; get that fx into B

    ; check if it's a control fx
    BIT         7, B                    ; if MSB is set, reset Z (make it off)
    JR          Z, BUFFER_NORMAL_CHAR  ; we are normal if the MSB isn't set

BUFFER_CONTROL_FX:
    CALL        BUFFER_FLIP_EXX         ; it's the only effect we've got for now!
    JR          BUFFER_CHECK_END        ; and move to next char etc

    ; find the char
BUFFER_NORMAL_CHAR:
    LD          HL, BUFFER_MESSAGE      ; start of buffer
                                        ; DE is still offset
    ADD         HL, DE                  ; add offset
    LD          A, (HL)                 ; get that char

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
    ; HL pixels, B fx/colour

    ; row 1
    LD          DE, PIXEL_BUFFER_ROWS + 16  ; last 4 bytes of the row
    CALL        BUFFER_QUEUE_COLOUR

    ; row 2
    LD          DE, PIXEL_BUFFER_ROWS + 20 + 16  
    CALL        BUFFER_QUEUE_COLOUR

    ; row 3
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 2) + 16  
    CALL        BUFFER_QUEUE_COLOUR

    ; row 4
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 3) + 16  
    CALL        BUFFER_QUEUE_COLOUR

    ; row 5
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 4) + 16  
    CALL        BUFFER_QUEUE_COLOUR

    ; row 6
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 5) + 16  
    CALL        BUFFER_QUEUE_COLOUR

    ; row 7
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 6) + 16  
    CALL        BUFFER_QUEUE_COLOUR

    ; row 8
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 7) + 16  
    CALL        BUFFER_QUEUE_COLOUR

BUFFER_CHECK_END:
    ; back to the next char, to work out next or start again at beginning...
    LD          HL, BUFFER_MESSAGE      ; start of buffer
    LD          DE, (BUFFER_MESSAGE_OFFSET)   ; offset
    INC         DE                      ; add to offset for next char
    ADD         HL, DE                  ; add offset
    LD          A, (HL)                 ; get that char
    CP          0                       ; check for null terminator
    JR          NZ, BUFFER_NEXT_CHAR

    LD          DE, 0                   ; point to start of message

BUFFER_NEXT_CHAR:
    LD          (BUFFER_MESSAGE_OFFSET), DE ; save new offset

BUFFER_DONE_CHAR:
    LD          A, (BUFFER_FRAME)       ; adbance frame
    INC         A
    LD          (BUFFER_FRAME), A

    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                             ; BUFFER_QUEUE

; render the char pixels into the buffer
; IN: HL pixels, B fx/colour, DE destination in pixel buffer
; OUT: HL has been advanced (rest don't matter)
BUFFER_QUEUE_COLOUR:
    ; if pixel 0 is on, put A into pixel buffer
    ; if off, put 0 into pixel buffer
    LD          A, (HL)             ; pixel in A
    CP          0                   
    JR          Z, BUFFER_QUEUE_COLOUR_OFF_0

BUFFER_QUEUE_COLOUR_ON_0:
    LD          A, B                ; B has fx/colour
    JR          BUFFER_QUEUE_COLOUR_DONE_0

BUFFER_QUEUE_COLOUR_OFF_0:
    LD          A, 0                ; blank for pixel off

BUFFER_QUEUE_COLOUR_DONE_0:
    LD          (DE), A             ; render to pixel buffer
    INC         DE                  ; next pixel

    ; pixel 1
    INC         HL          

    LD          A, (HL)             ; pixel in A
    CP          0                   
    JR          Z, BUFFER_QUEUE_COLOUR_OFF_1

BUFFER_QUEUE_COLOUR_ON_1:
    LD          A, B                ; B has fx/colour
    JR          BUFFER_QUEUE_COLOUR_DONE_1

BUFFER_QUEUE_COLOUR_OFF_1:
    LD          A, 0                ; blank for pixel off

BUFFER_QUEUE_COLOUR_DONE_1:
    LD          (DE), A             ; render to pixel buffer
    INC         DE                  ; next pixel

    ; pixel 2
    INC         HL          

    LD          A, (HL)             ; pixel in A
    CP          0                   
    JR          Z, BUFFER_QUEUE_COLOUR_OFF_2

BUFFER_QUEUE_COLOUR_ON_2:
    LD          A, B                ; B has fx/colour
    JR          BUFFER_QUEUE_COLOUR_DONE_2

BUFFER_QUEUE_COLOUR_OFF_2:
    LD          A, 0                ; blank for pixel off

BUFFER_QUEUE_COLOUR_DONE_2:
    LD          (DE), A             ; render to pixel buffer
    INC         DE                  ; next pixel

    ; pixel 3
    INC         HL          

    LD          A, (HL)             ; pixel in A
    CP          0                   
    JR          Z, BUFFER_QUEUE_COLOUR_OFF_3

BUFFER_QUEUE_COLOUR_ON_3:
    LD          A, B                ; B has fx/colour
    JR          BUFFER_QUEUE_COLOUR_DONE_3

BUFFER_QUEUE_COLOUR_OFF_3:
    LD          A, 0                ; blank for pixel off

BUFFER_QUEUE_COLOUR_DONE_3:
    LD          (DE), A             ; render to pixel buffer
    INC         DE                  ; next pixel

    INC         HL                  ; ready for next

    RET                             ; BUFFER_QUEUE_COLOUR


    ; flip between EXX / EX AF and 2 NOPs
BUFFER_FLIP_EXX:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    ; find if EXX is turned on
    LD          A, (TOP_BORDER_RENDER_ROW_1_EXX)
    CP          $D9                 ; is it an EXX?
    JR          Z, FLIP_EXX_OFF     ; yes - so turn off

    ; fall through
FLIP_EXX_ON:
    LD          A, $D9    
    LD          C, $08

    JR          FLIP_EXX_REPLACE

FLIP_EXX_OFF:
    LD          A, $00
    LD          C, $00

    ; fall through
FLIP_EXX_REPLACE:
    LD          HL, TOP_BORDER_RENDER_ROW_1_EXX

    LD          B, 56               ; 56 rows

FLIP_EXX_LOOP:
    LD          (HL), A
    INC         HL
    LD          (HL), C

    ; step over to next row's EXX opcode (-1 as we already stepped over once)
    LD          DE, TOP_BORDER_RENDER_ROW_2 - TOP_BORDER_RENDER_ROW_1 - 1
    ADD         HL, DE

    DJNZ        FLIP_EXX_LOOP

    ; and we're done!
    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                             ; BUFFER_FLIP_EXX



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

    RET                                     ; BUFFER_RENDER

; renders pixel buffer to render buffer - sine version
BUFFER_RENDER_SINE:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          B, 15                       ; 15 cols
    LD          D, 0
BUFFER_RENDER_SINE_LOOP:
    LD          E, B
    DEC         DE                           ; col offset 0-14

    CALL        BUFFER_LOAD_TEMP_COL        ; loads the values to a buffer
    CALL        BUFFER_RENDER_COL           ; blits from buffer
    DJNZ        BUFFER_RENDER_SINE_LOOP

    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                                     ; BUFFER_RENDER_SINE


; D is col offset
BUFFER_LOAD_TEMP_COL:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    ; sine index
    LD          A, (SINE_FRAME)
    INC         A                           ; inc frame to save
    LD          (SINE_FRAME), A             ; save frame
    DEC         A                           ; dec frame to use
    AND         %00111111                   ; base 0-63 offset
    ADD         D                           ; add col offset
    AND         %00111111                   ; 0-63 again for actual offset
    LD          E, A                        ; E stores actual offset
    LD          D, 0                        ; 16bit needed, done with offset D now

    ; get row offset in DE
    LD          HL, SINE_LUT
    ADD         HL, DE                      ; HL points to the offset
    LD          A, (HL)                     ; A is the offset
    LD          E, A                        ; store in E
    LD          D, 0                        ; 16bit needed, done with offset D now

    CP          0
    JR          Z, BUFFER_LOAD_TEMP_COL_CHAR    ; 0 index no top blanks

; top blanks
    LD          HL, RENDER_BUFFER_TEMP_COL
;     LD          B, A
; BUFFER_LOAD_TEMP_COL_TOP_LOOP:
;     LD          (HL), 0                     ; blank 
;     INC         HL                          ; next temp buffer position

;     DJNZ        BUFFER_LOAD_TEMP_COL_TOP_LOOP

    ; char - alway 8 pixels at 4 rows each
BUFFER_LOAD_TEMP_COL_CHAR:
;     LD          B, 8                        ; 8 pixel rows
; BUFFER_LOAD_TEMP_COL_CHAR_LOOP:
;     PUSH        HL
;     LD          HL, PIXEL_BUFFER_ROWS       ; start of buff
;     ADD         HL, DE                      ; add col offset
;     LD          A, (HL)                     ; get pixel colour
;     POP         HL

;     LD          (HL), A                     ; pixel colour
;     INC         HL                          ; next temp buffer position

;     LD          (HL), A                     ; pixel colour
;     INC         HL                          ; next temp buffer position

;     LD          (HL), A                     ; pixel colour
;     INC         HL                          ; next temp buffer position

;     LD          (HL), A                     ; pixel colour
;     INC         HL                          ; next temp buffer position

;     DJNZ        BUFFER_LOAD_TEMP_COL_CHAR_LOOP



; bottom blanks
    LD          A, E                        ; offset back in A
    CP          23                          
    JR          Z, BUFFER_LOAD_TEMP_COL_DONE    ; 23 index no bottom blanks
    LD          A, 23
    SUB         E                           ; 23 - offset is number of bottom blanks

    LD          B, A
BUFFER_LOAD_TEMP_COL_BOTTOM_LOOP:
    LD          (HL), 0                     ; blank 
    INC         HL                          ; next temp buffer position

    DJNZ        BUFFER_LOAD_TEMP_COL_BOTTOM_LOOP

BUFFER_LOAD_TEMP_COL_DONE:
    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                                     ; BUFFER_LOAD_TEMP_COL


; D is col offset
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

BUFFER_MESSAGE:
    DEFB        " OPEN BORDERS        "     ; 21 chars
    DEFB        " ALL ARE WELCOME        "  ; 24 chars
    DEFB        " OPEN MINDS        "       ; 19 chars
    DEFB        " B  O  R  D  E  R    "     ; 21 chars
    DEFB        "Q  OPEN      "             ; 13 chars
    DEFB        " BUILD BRIDGES       "     ; 21 chars
    DEFB        0                           ; terminator

; offset for both chars and fx
BUFFER_MESSAGE_OFFSET:
    DEFW        0

; colour / fx details for each char in MESSAGE
BUFFER_MESSAGE_META:
    DEFS        21, 1     ; 21 chars OPEN BORDERS
    DEFB        $FF       ; EXX ON
    DEFS        23, 3     ; 24-1 chars ALL ARE WELCOME
    DEFS        18, 2     ; 19-1 chars OPEN MINDS
    DEFB        $FF       ; EXX OFF
;    DEFB        " F  N  O  R  D  S       "  ; 21 chars - 1
    DEFB        1, 5, 5, 5, 4, 4, 4, 1, 1, 1, 3, 3, 3, 2, 2, 2, 1, 1, 1,    1
    DEFB        $FF       ; EXX ON
    DEFB        8         ; glitch the Q
    DEFS        12, 7     ; 13-1 chars
    DEFS        20, 1     ; 21-1 chars BUILD BRIDGES

    DEFB        $FF       ; EXX back to off
                          ; no terminator, message does that

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
RENDER_BUFFER_ROWS:
RENDER_BUFFER_ROW_1:
    DEFS    15
RENDER_BUFFER_ROW_2:
    DEFS    15
RENDER_BUFFER_ROW_3:
    DEFS    15
RENDER_BUFFER_ROW_4:
    DEFS    15
RENDER_BUFFER_ROW_5:
    DEFS    15
RENDER_BUFFER_ROW_6:
    DEFS    15
RENDER_BUFFER_ROW_7:
    DEFS    15
RENDER_BUFFER_ROW_8:
    DEFS    15
RENDER_BUFFER_ROW_9:
    DEFS    15
RENDER_BUFFER_ROW_10:
    DEFS    15
RENDER_BUFFER_ROW_11:
    DEFS    15
RENDER_BUFFER_ROW_12:
    DEFS    15
RENDER_BUFFER_ROW_13:
    DEFS    15
RENDER_BUFFER_ROW_14:
    DEFS    15
RENDER_BUFFER_ROW_15:
    DEFS    15
RENDER_BUFFER_ROW_16:
    DEFS    15
RENDER_BUFFER_ROW_17:
    DEFS    15
RENDER_BUFFER_ROW_18:
    DEFS    15
RENDER_BUFFER_ROW_19:
    DEFS    15
RENDER_BUFFER_ROW_20:
    DEFS    15
RENDER_BUFFER_ROW_21:
    DEFS    15
RENDER_BUFFER_ROW_22:
    DEFS    15
RENDER_BUFFER_ROW_23:
    DEFS    15
RENDER_BUFFER_ROW_24:
    DEFS    15
RENDER_BUFFER_ROW_25:
    DEFS    15
RENDER_BUFFER_ROW_26:
    DEFS    15
RENDER_BUFFER_ROW_27:
    DEFS    15
RENDER_BUFFER_ROW_28:
    DEFS    15
RENDER_BUFFER_ROW_29:
    DEFS    15
RENDER_BUFFER_ROW_30:
    DEFS    15
RENDER_BUFFER_ROW_31:
    DEFS    15
RENDER_BUFFER_ROW_32:
    DEFS    15
RENDER_BUFFER_ROW_33:
    DEFS    15
RENDER_BUFFER_ROW_34:
    DEFS    15
RENDER_BUFFER_ROW_35:
    DEFS    15
RENDER_BUFFER_ROW_36:
    DEFS    15
RENDER_BUFFER_ROW_37:
    DEFS    15
RENDER_BUFFER_ROW_38:
    DEFS    15
RENDER_BUFFER_ROW_39:
    DEFS    15
RENDER_BUFFER_ROW_40:
    DEFS    15
RENDER_BUFFER_ROW_41:
    DEFS    15
RENDER_BUFFER_ROW_42:
    DEFS    15
RENDER_BUFFER_ROW_43:
    DEFS    15
RENDER_BUFFER_ROW_44:
    DEFS    15
RENDER_BUFFER_ROW_45:
    DEFS    15
RENDER_BUFFER_ROW_46:
    DEFS    15
RENDER_BUFFER_ROW_47:
    DEFS    15
RENDER_BUFFER_ROW_48:
    DEFS    15
RENDER_BUFFER_ROW_49:
    DEFS    15
RENDER_BUFFER_ROW_50:
    DEFS    15
RENDER_BUFFER_ROW_51:
    DEFS    15
RENDER_BUFFER_ROW_52:
    DEFS    15
RENDER_BUFFER_ROW_53:
    DEFS    15
RENDER_BUFFER_ROW_54:
    DEFS    15
RENDER_BUFFER_ROW_55:
    DEFS    15
RENDER_BUFFER_ROW_56:
    DEFS    15

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


