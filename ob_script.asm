
BUFFER_MESSAGE:
    DEFB        " OPEN BORDERS        "     ; 21 chars
    DEFB        " ALL ARE WELCOME        "  ; 24 chars
    DEFB        " B  O  R  D  E  R    "     ; 21 chars
    DEFB        "Q  OPEN      "             ; 13 chars
    DEFB        " BUILD BRIDGES       "     ; 21 chars

    DEFB        " THEY PAVED PARADISE    "  ; 24 chars
    DEFB        " AND PUT UP A PARKING LOT       "  ; 32 chars

    DEFB        0                           ; terminator

; offset for both chars and fx
BUFFER_MESSAGE_OFFSET:
    DEFW        0

; colour / fx details for each char in MESSAGE
BUFFER_MESSAGE_META:
    DEFS        21, 1     ; 21 chars OPEN BORDERS
    DEFB        $FF       ; EXX ON
    DEFS        22, 3     ; 24-2 chars ALL ARE WELCOME
    DEFB        $FF       ; EXX OFF
;    DEFB        " F  N  O  R  D  S       "  ; 21 chars - 1
    DEFB        1, 5, 5, 5, 4, 4, 4, 1, 1, 1, 3, 3, 3, 2, 2, 2, 1, 1, 1,    1
    DEFB        $FF       ; EXX ON
    DEFB        8         ; glitch the Q
    DEFS        12, 7     ; 13-1 chars (Q line)
    DEFS        20, 1     ; 21-1 chars BUILD BRIDGES
    DEFB        $FF       ; EXX back to off

    DEFB        $BF       ; sine on
    DEFS        23, 6     ; 24-1 chars They paved paradise
    DEFS        31, 4     ; 32-1 chars and put up a parking lot :(
    DEFB        $BF       ; sine off 
                          ; no terminator, message does that

