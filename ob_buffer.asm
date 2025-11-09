


; scrolls buffer to the left
BUFFER_SCROLL:
    PUSH        AF
    PUSH        BC
    PUSH        DE
    PUSH        HL

    LD          B, 56               ; 56 rows
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
; 56 border rows
; = 1,120b memory used
BUFFER_ROWS:
BUFFER_ROW_1:
    DEFS    20
BUFFER_ROW_2:
    DEFS    20
BUFFER_ROW_3:
    DEFS    20
BUFFER_ROW_4:
    DEFS    20
BUFFER_ROW_5:
    DEFS    20
BUFFER_ROW_6:
    DEFS    20
BUFFER_ROW_7:
    DEFS    20
BUFFER_ROW_8:
    DEFS    20
BUFFER_ROW_9:
    DEFS    20
BUFFER_ROW_10:
    DEFS    20
BUFFER_ROW_11:
    DEFS    20
BUFFER_ROW_12:
    DEFS    20
BUFFER_ROW_13:
    DEFS    20
BUFFER_ROW_14:
    DEFS    20
BUFFER_ROW_15:
    DEFS    20
BUFFER_ROW_16:
    DEFS    20
BUFFER_ROW_17:
    DEFS    20
BUFFER_ROW_18:
    DEFS    20
BUFFER_ROW_19:
    DEFS    20
BUFFER_ROW_20:
    DEFS    20
BUFFER_ROW_21:
    DEFS    20
BUFFER_ROW_22:
    DEFS    20
BUFFER_ROW_23:
    DEFS    20
BUFFER_ROW_24:
    DEFS    20
BUFFER_ROW_25:
    DEFS    20
BUFFER_ROW_26:
    DEFS    20
BUFFER_ROW_27:
    DEFS    20
BUFFER_ROW_28:
    DEFS    20
BUFFER_ROW_29:
    DEFS    20
BUFFER_ROW_30:
    DEFS    20
BUFFER_ROW_31:
    DEFS    20
BUFFER_ROW_32:
    DEFS    20
BUFFER_ROW_33:
    DEFS    20
BUFFER_ROW_34:
    DEFS    20
BUFFER_ROW_35:
    DEFS    20
BUFFER_ROW_36:
    DEFS    20
BUFFER_ROW_37:
    DEFS    20
BUFFER_ROW_38:
    DEFS    20
BUFFER_ROW_39:
    DEFS    20
BUFFER_ROW_40:
    DEFS    20
BUFFER_ROW_41:
    DEFS    20
BUFFER_ROW_42:
    DEFS    20
BUFFER_ROW_43:
    DEFS    20
BUFFER_ROW_44:
    DEFS    20
BUFFER_ROW_45:
    DEFS    20
BUFFER_ROW_46:
    DEFS    20
BUFFER_ROW_47:
    DEFS    20
BUFFER_ROW_48:
    DEFS    20
BUFFER_ROW_49:
    DEFS    20
BUFFER_ROW_50:
    DEFS    20
BUFFER_ROW_51:
    DEFS    20
BUFFER_ROW_52:
    DEFS    20
BUFFER_ROW_53:
    DEFS    20
BUFFER_ROW_54:
    DEFS    20
BUFFER_ROW_55:
    DEFS    20
BUFFER_ROW_56:
    DEFS    20
