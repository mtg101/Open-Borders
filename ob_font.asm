


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
    defw        OB_FONT_D
    defw        OB_FONT_E
    defw        OB_FONT_F
    defw        OB_FONT_G
    defw        OB_FONT_H
    defw        OB_FONT_I
    defw        OB_FONT_J
    defw        OB_FONT_K
    defw        OB_FONT_L
    defw        OB_FONT_M
    defw        OB_FONT_N
    defw        OB_FONT_O

    defw        OB_FONT_P           ; 0x50 P-Z
    defw        OB_FONT_Q
    defw        OB_FONT_R
    defw        OB_FONT_S
    defw        OB_FONT_T
    defw        OB_FONT_U
    defw        OB_FONT_V
    defw        OB_FONT_W
    defw        OB_FONT_X
    defw        OB_FONT_Y
    defw        OB_FONT_Z
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

OB_FONT_D:
    defb       1, 1, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 0, 0

OB_FONT_E:
    defb       1, 1, 1, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 1, 1, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 1, 1, 0

OB_FONT_F:
    defb       1, 1, 1, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 1, 1, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0

OB_FONT_G:
    defb       0, 1, 1, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 0, 0

OB_FONT_H:
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0

OB_FONT_I:
    defb       1, 1, 1, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       1, 1, 1, 0

OB_FONT_J:
    defb       1, 1, 1, 0
    defb       0, 0, 1, 0
    defb       0, 0, 1, 0
    defb       0, 0, 1, 0
    defb       0, 0, 1, 0
    defb       0, 0, 1, 0
    defb       1, 0, 1, 0
    defb       0, 1, 0, 0

OB_FONT_K:
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 0, 0
    defb       1, 1, 0, 0
    defb       1, 1, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0

OB_FONT_L:
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 1, 1, 0

OB_FONT_M:
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0
    defb       1, 1, 1, 0
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0

OB_FONT_N:
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0

OB_FONT_O:
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0

OB_FONT_P:
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0

OB_FONT_Q:
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 1

OB_FONT_R:
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0
    defb       1, 1, 0, 0
    defb       1, 1, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0

OB_FONT_S:
    defb       1, 1, 1, 0
    defb       1, 0, 0, 0
    defb       1, 0, 0, 0
    defb       1, 1, 1, 0
    defb       0, 0, 1, 0
    defb       0, 0, 1, 0
    defb       0, 0, 1, 0
    defb       1, 1, 1, 0

OB_FONT_T:
    defb       1, 1, 1, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0

OB_FONT_U:
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0

OB_FONT_V:
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0

OB_FONT_W:
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       1, 1, 1, 0
    defb       1, 1, 1, 0
    defb       1, 1, 1, 0
    defb       1, 0, 1, 0

OB_FONT_X:
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0

OB_FONT_Y:
    defb       1, 0, 1, 0
    defb       1, 0, 1, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 0, 0, 0
    defb       0, 0, 0, 0

OB_FONT_Z:
    defb       1, 1, 1, 0
    defb       0, 0, 1, 0
    defb       0, 0, 1, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       0, 1, 0, 0
    defb       1, 0, 0, 0
    defb       1, 1, 1, 0

