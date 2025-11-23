
; rand16 from http://z80-heaven.wikidot.com/advanced-math#toc72 
RNG: 								
    ld 		hl, (SEED1)
    ld 		b, h
    ld 		c, l
    add 	hl, hl
    add 	hl, hl
    inc 	l
    add 	hl,bc
    ld 		(SEED1),hl
    ld 		hl,(SEED2)
    add 	hl,hl
    sbc 	a, a
    and 	%00101101
    xor 	l
    ld 		l, a
    ld 		(SEED2),hl
    add 	hl,bc
	ld		(NEXT_RNG), hl			; store in (NEXT_RNG)
    ret								; RNG

; seeds are static for setup
; but then we wait for user to press space and use coutners to ramdomize seeds for animation
SEED1:
	defw	255
SEED2:
	defw	1312					
	
NEXT_RNG:
	defw	0
	
    


SINE_LUT:
    DEFB        12
    DEFB        13
    DEFB        14
    DEFB        15
    DEFB        16
    DEFB        17
    DEFB        18
    DEFB        19
    DEFB        20
    DEFB        20
    DEFB        21
    DEFB        22
    DEFB        22
    DEFB        23
    DEFB        23
    DEFB        23
    DEFB        23
    DEFB        23
    DEFB        23
    DEFB        23
    DEFB        22
    DEFB        22
    DEFB        21
    DEFB        20
    DEFB        20
    DEFB        19
    DEFB        18
    DEFB        17
    DEFB        16
    DEFB        15
    DEFB        14
    DEFB        13
    DEFB        12
    DEFB        10
    DEFB        9
    DEFB        8
    DEFB        7
    DEFB        6
    DEFB        5
    DEFB        4
    DEFB        3
    DEFB        3
    DEFB        2
    DEFB        1
    DEFB        1
    DEFB        0
    DEFB        0
    DEFB        0
    DEFB        0
    DEFB        0
    DEFB        0
    DEFB        0
    DEFB        1
    DEFB        1
    DEFB        2
    DEFB        3
    DEFB        3
    DEFB        4
    DEFB        5
    DEFB        6
    DEFB        7
    DEFB        8
    DEFB        9
    DEFB        10





