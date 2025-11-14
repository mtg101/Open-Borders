


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
    INC         HL
    INC         DE
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

    LD          HL, (BUFFER_MESSAGE_INDEX)
    LD          A, (HL)

    ; find the pixels
    LD          HL, OB_FONT_ASCII       ; base LUT
    SLA         A                       ; double ASCII value to move Words into LUT
    LD          D, 0
    LD          E, A
    ADD         HL, DE                  ; HL now points to the pixels

    ; render the char pixels into the buffer

    ; row 1
    LD          DE, PIXEL_BUFFER_ROWS + 16  

    ; copy pixels
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    ; row 2
    LD          DE, PIXEL_BUFFER_ROWS + 20 + 16  

    ; copy pixels
    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    ; row 3
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 2) + 16  

    ; copy pixels
    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    ; row 4
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 3) + 16  

    ; copy pixels
    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    ; row 5
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 4) + 16  

    ; copy pixels
    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    ; row 6
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 5) + 16  

    ; copy pixels
    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    ; row 7
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 6) + 16  

    ; copy pixels
    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    ; row 8
    LD          DE, PIXEL_BUFFER_ROWS + (20 * 7) + 16  

    ; copy pixels
    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A

    INC         HL
    LD          A, (HL)
    LD          (DE), A


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

    ; thick row 1/8
    LD          HL, PIXEL_BUFFER_ROWS
    LD          DE, RENDER_BUFFER_ROWS

    .15 LDI                             ; all 15 visible bars - row 1/7

    LD          HL, PIXEL_BUFFER_ROWS   ; reset source
    .15 LDI                             ; all 15 visible bars - row 2/7

    LD          HL, PIXEL_BUFFER_ROWS   ; reset source
    .15 LDI                             ; all 15 visible bars - row 3/7

    LD          HL, PIXEL_BUFFER_ROWS   ; reset source
    .15 LDI                             ; all 15 visible bars - row 4/7

    LD          HL, PIXEL_BUFFER_ROWS   ; reset source
    .15 LDI                             ; all 15 visible bars - row 5/7

    LD          HL, PIXEL_BUFFER_ROWS   ; reset source
    .15 LDI                             ; all 15 visible bars - row 6/7

    LD          HL, PIXEL_BUFFER_ROWS   ; reset source
    .15 LDI                             ; all 15 visible bars - row 7/7

    ; thick row 2/8
    LD          HL, PIXEL_BUFFER_ROWS + 20  ; 20 pixels per row in pixel buffer

    .15 LDI                             ; all 15 visible bars - row 1/7

    LD          HL, PIXEL_BUFFER_ROWS + 20   ; reset source
    .15 LDI                             ; all 15 visible bars - row 2/7

    LD          HL, PIXEL_BUFFER_ROWS + 20   ; reset source
    .15 LDI                             ; all 15 visible bars - row 3/7

    LD          HL, PIXEL_BUFFER_ROWS + 20   ; reset source
    .15 LDI                             ; all 15 visible bars - row 4/7

    LD          HL, PIXEL_BUFFER_ROWS + 20   ; reset source
    .15 LDI                             ; all 15 visible bars - row 5/7

    LD          HL, PIXEL_BUFFER_ROWS + 20   ; reset source
    .15 LDI                             ; all 15 visible bars - row 6/7

    LD          HL, PIXEL_BUFFER_ROWS + 20   ; reset source
    .15 LDI                             ; all 15 visible bars - row 7/7

    ; thick row 3/8
    LD          HL, PIXEL_BUFFER_ROWS + (20 * 2)  ; 20 pixels per row in pixel buffer

    .15 LDI                             ; all 15 visible bars - row 1/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 2)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 2/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 2)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 3/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 2)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 4/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 2)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 5/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 2)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 6/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 2)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 7/7

    ; thick row 4/8
    LD          HL, PIXEL_BUFFER_ROWS + (20 * 3)  ; 20 pixels per row in pixel buffer

    .15 LDI                             ; all 15 visible bars - row 1/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 3)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 2/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 3)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 3/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 3)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 4/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 3)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 5/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 3)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 6/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 3)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 7/7

    ; thick row 5/8
    LD          HL, PIXEL_BUFFER_ROWS + (20 * 4)  ; 20 pixels per row in pixel buffer

    .15 LDI                             ; all 15 visible bars - row 1/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 4)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 2/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 4)  ; reset source
    .15 LDI                             ; all 15 visible bars - row 3/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 4)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 4/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 4)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 5/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 4)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 6/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 4)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 7/7

    ; thick row 6/8
    LD          HL, PIXEL_BUFFER_ROWS + (20 * 5)  ; 20 pixels per row in pixel buffer

    .15 LDI                             ; all 15 visible bars - row 1/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 5)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 2/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 5)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 3/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 5)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 4/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 5)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 5/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 5)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 6/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 5)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 7/7

    ; thick row 7/8
    LD          HL, PIXEL_BUFFER_ROWS + (20 * 6)  ; 20 pixels per row in pixel buffer

    .15 LDI                             ; all 15 visible bars - row 1/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 6)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 2/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 6)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 3/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 6)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 4/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 6)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 5/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 6)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 6/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 6)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 7/7

    ; thick row 8/8
    LD          HL, PIXEL_BUFFER_ROWS + (20 * 7)  ; 20 pixels per row in pixel buffer

    .15 LDI                             ; all 15 visible bars - row 1/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 7)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 2/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 7)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 3/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 7)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 4/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 7)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 5/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 7)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 6/7

    LD          HL, PIXEL_BUFFER_ROWS + (20 * 7)   ; reset source
    .15 LDI                             ; all 15 visible bars - row 7/7


    POP         HL
    POP         DE
    POP         BC
    POP         AF

    RET                             ; BUFFER_RENDER


BUFFER_FRAME:
    DEFB        0

BUFFER_MESSAGE:
    DEFB        "ALL ARE WELCOME HERE         "
    DEFB        "COME CLOSE TO THE EDGE        "
    DEFB        "EXPLORE THE BORDER           "
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
; 56 row of course
; 15 wide as that's how many stripes can display
; 56 * 15 = 840
RENDER_BUFFER_ROWS:
    DEFS    840

