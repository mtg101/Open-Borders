


; scrolls buffer to the left
BUFFER_SCROLL:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          B, 8                ; 8 rows (just for pixels, get made taller during render)
    LD          DE, BUFFER_ROWS     ; start of buffer to copy to
    LD          HL, BUFFER_ROWS + 1 ; offset buffer to copy from
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
BUFFER_QUEUE:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          A, (BUFFER_FRAME)
    AND         %00000011
    JR          NZ, BUFFER_DONE_CHAR    ; skip if it's not frame 00

    LD          HL, (BUFFER_MESSAGE_INDEX)
    LD          A, (HL)

    ; todo - render the next character into the buffer

    ; todo - if we're at the null terminator, start again at the beginning

    INC         HL
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
; 8 rows (of 7 pixels each, rendered separately)
; buffer = 160 bytes

BUFFER_ROWS:
    DEFS    160
