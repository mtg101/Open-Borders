


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
    JR          Z, BUFFER_NORMAL_CHAR   ; we are normal if the MSB isn't set

    ; it's an effect - MSB(7) is 1, use 6 for which fx for now
    BIT         6, B
    JR          NZ, BUFFER_FX_EXX

BUFEER_FX_SINE:    
    CALL        BUFFER_FLIP_SINE
    JR          BUFFER_FX_DONE
BUFFER_FX_EXX:
    CALL        BUFFER_FLIP_EXX         

BUFFER_FX_DONE:
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


    ; flip sine on / off
BUFFER_FLIP_SINE:
    PUSH        AF

    LD          A, (SINE_STATE)     ; bool! it's either 0 or 1
    XOR         %00000001           ; so we flip the bool!
    LD          (SINE_STATE), A     ; save inverted state

    ; and we're done!
    POP         AF

    RET                             ; BUFFER_FLIP_EXX


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
; part 1 - too slow for single frame
BUFFER_RENDER_SINE_1:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          A, (SINE_FRAME)
    INC         A                           ; inc frame to save
    LD          (SINE_FRAME), A             ; save frame
    DEC         A                           ; dec frame to use

    LD          B, 9                        ; first 9 cols / 15
BUFFER_RENDER_SINE_LOOP_1:
    LD          D, 0
    LD          E, B
    DEC         DE                           ; col offset 0-14

    CALL        BUFFER_LOAD_TEMP_COL        ; loads the values to a buffer
    CALL        BUFFER_RENDER_COL           ; blits from buffer
    DJNZ        BUFFER_RENDER_SINE_LOOP_1

    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                                     ; BUFFER_RENDER_SINE_1

; renders pixel buffer to render buffer - sine version
; part 2 - too slow for single frame
BUFFER_RENDER_SINE_2:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          A, (SINE_FRAME)
    INC         A                           ; inc frame to save
    LD          (SINE_FRAME), A             ; save frame
    DEC         A                           ; dec frame to use

    LD          B, 6                       ; done 9, 6 left
BUFFER_RENDER_SINE_LOOP_2:
    LD          D, 0
    LD          E, B
    INC         DE                          ; plus... somhow 8? 9-1? it works...
    INC         DE                          
    INC         DE                          
    INC         DE                          
    INC         DE                          
    INC         DE                          
    INC         DE                          
    INC         DE                          

    CALL        BUFFER_LOAD_TEMP_COL        ; loads the values to a buffer
    CALL        BUFFER_RENDER_COL           ; blits from buffer
    DJNZ        BUFFER_RENDER_SINE_LOOP_2

    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                                     ; BUFFER_RENDER_SINE_2


; DE is col offset
; A is sine frame
BUFFER_LOAD_TEMP_COL:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    ; sort out pixel ptr for the char
    LD          HL, PIXEL_BUFFER_ROWS       ; start of pixel buffer
    ADD         HL, DE                      ; offset to column
    LD          (PIXEL_BUF_PTR), HL         

    ; sine index
    AND         %00111111                   ; base 0-63 offset
    ADD         E                           ; add col offset
    AND         %00111111                   ; 0-63 again for actual offset
    LD          E, A                        ; E stores actual offset
    LD          D, 0                        ; 16bit needed, done with offset D now

    ; get row offset in DE
    LD          HL, SINE_LUT
    ADD         HL, DE                      ; HL points to the offset
    LD          A, (HL)                     ; A is the row offset

    LD          E, A                        ; store row offet in E
    LD          D, 0                        ; 16bit needed, done with col offset DE now
    LD          HL, RENDER_BUFFER_TEMP_COL

    CP          0
    JR          Z, BUFFER_LOAD_TEMP_COL_CHAR    ; 0 index no top blanks

; top blanks
    LD          B, A
BUFFER_LOAD_TEMP_COL_TOP_LOOP:
    LD          (HL), $71                   ; blank / OUT (C), 0 = $71
    INC         HL                          ; next temp buffer position

    DJNZ        BUFFER_LOAD_TEMP_COL_TOP_LOOP

    ; char - alway 8 pixels at 4 rows each
BUFFER_LOAD_TEMP_COL_CHAR:
    LD          B, 8                        ; 8 pixel rows
BUFFER_LOAD_TEMP_COL_CHAR_LOOP:
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          HL, (PIXEL_BUF_PTR)
    LD          A, (HL)                     ; get pixel colour
    LD          DE, 20                      ; pixel buffer has extra cols
    ADD         HL, DE                      ; move to next row         
    LD          (PIXEL_BUF_PTR), HL

    LD          B, 0                        ; needed for 16bit ADD
    ; convert pixel to register
    LD          C, A                        ; BC is now offset
    LD          HL, BUFFER_REGISTER_LUT     ; base LUT
    ADD         HL, BC                      ; HL points to reg in LUT
    LD          A, (HL)                     ; A has reg

    POP         HL
    POP         DE
    POP         BC
    
    ; set 4 rows to that colour (0 from pixel buffer works)
    LD          (HL), A                     ; reg
    INC         HL                          ; next temp buffer position

    LD          (HL), A                     ; reg
    INC         HL                          ; next temp buffer position

    LD          (HL), A                     ; reg
    INC         HL                          ; next temp buffer position

    LD          (HL), A                     ; reg
    INC         HL                          ; next temp buffer position

    DJNZ        BUFFER_LOAD_TEMP_COL_CHAR_LOOP

; bottom blanks
    LD          A, E                        ; offset back in A
    CP          24                          
    JR          Z, BUFFER_LOAD_TEMP_COL_DONE    ; 24 index no bottom blanks
    LD          A, 24
    SUB         E                           ; 24 - offset is number of bottom blanks

    LD          B, A
BUFFER_LOAD_TEMP_COL_BOTTOM_LOOP:
    LD          (HL), $71                   ; blank / OUT (C), 0 = $71
    INC         HL                          ; next temp buffer position

    DJNZ        BUFFER_LOAD_TEMP_COL_BOTTOM_LOOP

BUFFER_LOAD_TEMP_COL_DONE:
    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                                     ; BUFFER_LOAD_TEMP_COL

