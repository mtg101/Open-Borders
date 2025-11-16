	SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION	; for VSCODE and debugging
	DEVICE ZXSPECTRUM48 			; needed for SNA export (must be tab indented)
	ORG 	$8000					; the uncontended 32KiB
	

	INCLUDE "speccy_defs.asm"		; must be indented
	INCLUDE "ob_top_border_render.asm"
	INCLUDE "ob_font.asm"
	INCLUDE "ob_buffer.asm"
	
START:
	CALL	INITIALISE_INTERRUPT	; IM2 with ROM trick
	CALL	INITIAL_SETUP			; border black, any other set up

ANIMATE_MAIN:
	CALL	SETUP_DURING_SCREEN_DRAW; prepare evenrything, incuding CMS, during main screen draw

	HALT							; wait for vsync (fired after bottom border, start of vblank)

	CALL	VBLANK_PERIOD_WORK		; 8 scanline * 224 = 1952 t-states (minus some for alignment timing)
	CALL	TOP_BORDER_RENDER		; timining-critical flipping of top border colours
	JR		ANIMATE_MAIN

; 8 scanline * 224 = 1952 t-states (minus some for alignment timing)
VBLANK_PERIOD_WORK:		
	; OK so this is just guesswork and fiddling now... 
	PUSH AF
	PUSH BC
	PUSH DE
	PUSH HL

	LD		B, 120
VBLANK_LOOP:
	DJNZ	VBLANK_LOOP				

	; fiddling...
	LD	A, 7
	LD	A, 7
	;NOP
	;NOP

	POP HL
	POP DE
	POP BC
	POP AF

	RET								; VBLANK_PERIOD_WORK
									
; border black and other set up
INITIAL_SETUP:
	ld 		A, COL_BLK				; black border
	OUT		($FE), A				; set border black

	LD		A, COL_BLK				
	LD		B, COL_RED				
	LD		C, $FE					; border OUT addr
	LD		D, COL_GRN			
	LD		E, COL_YEL			
	LD		H, COL_WHT			
	LD		L, COL_BLU

	ret								; INITIAL_SETUP

; prepare evenrything, incuding SMC, during main screen draw
SETUP_DURING_SCREEN_DRAW: 
    PUSH 	AF
	LD 		A, (MAIN_FRAME)
	AND   	%00000011				; 4 frames

	CP      %00000001
	JR      Z, MAIN_FRAME_1			; frame 1

	CP      %00000010
	JR      Z, MAIN_FRAME_2			; frame 2

	CP      %00000011
	JR      Z, MAIN_FRAME_3			; frame 3

									; so frame 0...

MAIN_FRAME_0:
	CALL 	BUFFER_QUEUE_CHAR		; add new char if needed
	JR 		MAIN_FRAME_DONE

MAIN_FRAME_1:
	CALL 	BUFFER_SCROLL			; scroll buffer
	JR 		MAIN_FRAME_DONE

MAIN_FRAME_2:
	CALL	BUFFER_RENDER			; pixel buf to render buf
	JR 		MAIN_FRAME_DONE

MAIN_FRAME_3:
	CALL	RENDER_SMC				; self-modify the rendering registers from the buffer

MAIN_FRAME_DONE:
	LD 		A, (MAIN_FRAME)
	INC 	A
	LD 		(MAIN_FRAME), A

	POP 	AF

	RET								; SETUP_DURING_SCREEN_DRAW


; set up IM2 - so we don't wate time scanning keyboard and so on
; use ROM trick for interrupt table
; from http://www.breakintoprogram.co.uk/hardware/computers/zx-spectrum/interrupts 
INITIALISE_INTERRUPT:   			
	di                              ; Disable interrupts
	ld		hl, INTERRUPT
	ld		ix, $FFF0				; This code is to be written at 0xFF
	ld		(ix + $04), $C3         ; Opcode for JP
	ld		(ix + $05), l           ; Store the address of the interrupt routine in
	ld		(ix + $06), h
	ld		(ix + $0F), $18         ; Opcode for JR; this will do JR to FFF4h
	ld		a, $39                  ; Interrupt table at page 0x3900 (ROM)
	ld		i, a                    ; Set the interrupt register to that page
	im		2                       ; Set the interrupt mode
	ei                              ; Enable interrupts
	ret								; INITIALISE_INTERRUPT
 
INTERRUPT:              
	; push af                       ; save all the registers on the stack
	; push bc                       ; this is probably not necessary unless
	; push de                       ; we're looking at returning cleanly
	; push hl                       ; back to basic at some point
	; push ix
	; exx
	; ex af,af
	; push af
	; push bc
	; push de
	; push hl
	; push iy


; do stuff

	; pop iy                        ; restore all the registers
	; pop hl
	; pop de
	; pop bc
	; pop af
	; exx
	; ex af,af
	; pop ix
	; pop hl
	; pop de
	; pop bc
	; pop af
	EI                               ; Enable interrupts
	RET                              ; INTERRUPT

MAIN_FRAME:
	DEFB 		0

; include specific memory areas
	INCLUDE "ob_image.asm"

; Deployment: Snapshot
   SAVESNA 	"open_borders.sna", START
   