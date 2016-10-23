TODO: 
create the ELF object files and link them
	> nasm -f elf64 multiboot_h.asm
	> nasm -f elf64 boot.asm
	> ld -n -o kernel.bin -T linker.ld multiboot_h.o boot.o

create a bootable image
	> grub-mkrescue -o os.iso isofiles

create makefiles
