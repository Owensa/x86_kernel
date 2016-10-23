section.multiboot_h
header_start:
	dd 0xe85250d6			; multiboot 2
	dd 0				; architecture 0
	dd header_end - header_start    ; header length 
	;checksum
	dd 0x100000000 - (0xe8525 + 0 + (header_end - header_start))

	; multiboot tags are gonna go here
	; end tag requires
	
	dw 0 ;type
	dw 0 ;flags
	dw 8 ;size 
header_end:
