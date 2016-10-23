global start 

section .text 
bits 32
start:
	mov esp, stack_top
	;doing multiboot compliant checks, mb, CPUID, long mode.
	call check_multiboot
	call check_cpuid
	call check_long_mode
	; print OK to the screen
	mov dword [0xb8000], 0x2f4b2f4f
	hlt
;ERR procedure 
error:
	mov dword [0xb8000], 0x4f524f45
	mov dword [0xb8004], 0x4f3a4f52
	mov dword [0xb0008], 0x4f204f20
	move byte [0xb800a], al
	hlt
;init stack memory
section .bss
stack_bottom:
	resb 64
stack_top:

