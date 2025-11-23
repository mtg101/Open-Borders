	SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION	; for VSCODE and debugging
	DEVICE ZXSPECTRUM48 			; needed for SNA export (must be tab indented)
	ORG 	$8000					; the uncontended 32KiB
	

	INCLUDE "speccy_defs.asm"		; must be indented
	INCLUDE "ob_top_border_render.asm"
	INCLUDE "ob_font.asm"
	INCLUDE "ob_buffer.asm"
	INCLUDE "maths.asm"
	
START:
	CALL	INITIALISE_INTERRUPT	; IM2 with ROM trick
	CALL	INITIAL_SETUP			; border black, any other set up

ANIMATE_MAIN:
	CALL	SETUP_DURING_SCREEN_DRAW; prepare evenrything, incuding CMS, during main screen draw

	HALT							; wait for vsync (fired after bottom border, start of vblank)

	CALL	VBLANK_PERIOD_WORK		; 8 scanline * 224 = 1952 t-states (minus some for alignment timing)
	CALL	TOP_BORDER_RENDER		; timining-critical flipping of top border colours
	JR		ANIMATE_MAIN

; 8 scanline * 224 = 1,752 t-states (minus some for alignment, push/pop, calls, etc...)
; we use it to flicker a window's colour based on pre-caculated stuff 
VBLANK_PERIOD_WORK:					
	PUSH AF							
	PUSH BC							
	PUSH DE							
	PUSH HL							

	LD	 A, (FLICKER_COLOUR)		
    LD   (ATTR_WINDOW_FLICKER), A	
    LD   (ATTR_WINDOW_FLICKER+1), A	
    LD   (ATTR_WINDOW_FLICKER+2), A	

	LD		B, 117					

VBLANK_LOOP:						
	DJNZ	VBLANK_LOOP				
									
	; fiddling...
	; LD	A, 7					
	; LD	A, 7					
	; NOP							
	; NOP							

	POP HL							
	POP DE							
	POP BC							
	POP AF							

	RET								; VBLANK_PERIOD_WORK
									
; border black and other set up
INITIAL_SETUP:
	LD		C, $FE					; border OUT addr / yellow (makes noise...)
	OUT		(C), 0					; set border black

	LD 		A, COL_BLU				; main palette
	LD		B, COL_RED
	LD		D, COL_MAG
	LD		E, COL_GRN
	LD		H, COL_CYN
	LD		L, COL_WHT

	EXX
	EX		AF

	LD 		A, COL_RED				; alt palette
	LD		B, COL_MAG
	LD		D, COL_GRN
	LD		E, COL_CYN
	LD		H, COL_WHT
	LD		L, COL_BLU

	EX 		AF
	EXX

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
	CALL	RENDER_SMC				; self-modify the rendering registers from the buffer
	JR 		MAIN_FRAME_DONE

MAIN_FRAME_1:
	CALL 	BUFFER_QUEUE_CHAR		; add new char if needed
	JR 		MAIN_FRAME_DONE

MAIN_FRAME_2:
	CALL 	BUFFER_SCROLL			; scroll buffer
	CALL	IMAGE_SETUP_FLICKER		; windows go brrr..
	JR 		MAIN_FRAME_DONE

MAIN_FRAME_3:
;	CALL	BUFFER_RENDER			; pixel buf to render buf
	CALL 	BUFFER_RENDER_SINE		; pixel buf to render buf, with sine
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
   