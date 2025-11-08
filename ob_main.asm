	SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION	; for VSCODE and debugging
	DEVICE ZXSPECTRUM48 			; needed for SNA export (must be tab indented)
	org $8000						; the uncontended 32KiB
	

	INCLUDE "speccy_defs.asm"		; must be indented
	INCLUDE "ob_top_border_render.asm"
	
START:
	call	INITIALISE_INTERRUPT	; IM2 with ROM trick
	call	INITIAL_SETUP			; border black, any other set up

ANIMATE_MAIN:
	call	SETUP_DURING_SCREEN_DRAW; prepare evenrything, incuding CMS, during main screen draw

	halt							; wait for vsync (fired after bottom border, start of vblank)

	call	VBLANK_PERIOD_WORK		; 8 scanline * 224 = 1952 t-states (minus some for alignment timing)
	call	TOP_BORDER_RENDER		; timining-critical flipping of top border colours
	jr		ANIMATE_MAIN

; 8 scanline * 224 = 1952 t-states (minus some for alignment timing)
VBLANK_PERIOD_WORK:		

	; OK so this is just guesswork and fiddling now... 
	push af
	push bc
	push de
	push hl

	LD		B, 120
VBLANK_LOOP:
	DJNZ	VBLANK_LOOP				

	; fiddling...
	LD	A, 7
	NOP
	NOP

	pop hl
	pop de
	pop bc
	pop af

	ret								; VBLANK_PERIOD_WORK
									



; border black and other set up
INITIAL_SETUP:
	ld 		A, COL_BLK				; black border
	OUT		($FE), A				; set border black

	LD		A, COL_RED				
	LD		B, COL_BLU				
	LD		C, $FE					; border OUT addr
	LD		D, COL_GRN			
	LD		E, COL_CYN			
	LD		H, COL_WHT			
	LD		L, COL_BLK

	ret								; INITIAL_SETUP


; prepare evenrything, incuding SMC, during main screen draw
SETUP_DURING_SCREEN_DRAW: 

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
	ei                               ; Enable interrupts
	ret                              ; INTERRUPT

; Deployment: Snapshot
   SAVESNA 	"open_borders.sna", START
   