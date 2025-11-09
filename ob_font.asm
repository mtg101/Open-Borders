


; LUT for ascii to font char
OB_FONT_ASCII:
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK

    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK
    defw        OB_FONT_BLANK

    defw        OB_FONT_BLANK       ; 0x20 space
    defw        OB_FONT_BLANK       ; !
    defw        OB_FONT_BLANK       ; "
    defw        OB_FONT_BLANK       ; #
    defw        OB_FONT_BLANK       ; $
    defw        OB_FONT_BLANK       ; %
    defw        OB_FONT_BLANK       ; &
    defw        OB_FONT_BLANK       ; '
    defw        OB_FONT_BLANK       ; (
    defw        OB_FONT_BLANK       ; )
    defw        OB_FONT_BLANK       ; *
    defw        OB_FONT_BLANK       ; +
    defw        OB_FONT_BLANK       ; ,
    defw        OB_FONT_BLANK       ; -
    defw        OB_FONT_BLANK       ; .
    defw        OB_FONT_BLANK       ; /

    defw        OB_FONT_BLANK       ; 0x30 0-9
    defw        OB_FONT_BLANK       ; 1
    defw        OB_FONT_BLANK       ; 2
    defw        OB_FONT_BLANK       ; 3
    defw        OB_FONT_BLANK       ; 4
    defw        OB_FONT_BLANK       ; 5
    defw        OB_FONT_BLANK       ; 6
    defw        OB_FONT_BLANK       ; 7
    defw        OB_FONT_BLANK       ; 8
    defw        OB_FONT_BLANK       ; 9
    defw        OB_FONT_BLANK       ; :
    defw        OB_FONT_BLANK       ; ;
    defw        OB_FONT_BLANK       ; <
    defw        OB_FONT_BLANK       ; =
    defw        OB_FONT_BLANK       ; >
    defw        OB_FONT_BLANK       ; ?

    defw        OB_FONT_BLANK       ; 0x40 @
    defw        OB_FONT_A           ; A-O
    defw        OB_FONT_B
    defw        OB_FONT_C
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A

    defw        OB_FONT_A           ; 0x50 P-Z
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_A
    defw        OB_FONT_BLANK       ; [
    defw        OB_FONT_BLANK       ; \
    defw        OB_FONT_BLANK       ; ]
    defw        OB_FONT_BLANK       ; ^
    defw        OB_FONT_BLANK       ; _




; font is 4x8 (4 includes gap, so 3 for char == each of 8 rows is 7 rows)
OB_FONT_BLANK:
    defb       0, 0, 0, 0
    defb       0, 0, 0, 0
    defb       0, 0, 0, 0
    defb       0, 0, 0, 0
    defb       0, 0, 0, 0
    defb       0, 0, 0, 0
    defb       0, 0, 0, 0
    defb       0, 0, 0, 0

OB_FONT_A:
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0

OB_FONT_B:
    defb       1, 1, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 0, 0

OB_FONT_C:
    defb       1, 1, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 0, 0


