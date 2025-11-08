	SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION	; for VSCODE and debugging
	DEVICE ZXSPECTRUM48 			; needed for SNA export (must be tab indented)
	org $8000						; the uncontended 32KiB
	

	INCLUDE "speccy_defs.asm"		; must be indented
	
START:
	call	INITIALISE_INTERRUPT	; IM2 with ROM trick

ANIMATE_MAIN:
	halt							; wait for vsync before draw

	jr		ANIMATE_MAIN


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
	ret								; Initialise_Interrupt
 
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


; static border
 	; ld		a, COL_BLK
 	; out		($FE), a

	; .3480 nop

 	; ld		a, COL_BLU
 	; out		($FE), a


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
   