arch?= x86_64
kernel := build/kernel-$(architecture).bin
iso := build/os-$(architecture).iso

linker_script := src/architecture/$(architecture)/linker.ld
grub_cfg := src/architecture/$(architecture)/grub.cfg
assembly_source_files := $(wildcard src/architecture/$(architecture)/*.asm)
assembly_object_files := $(patsubst src/architecture/$(architecture)/%.asm, build/architecture/$(architecture)/%.o, $(assembly_source_files))
 
.PHONY: all clean run iso

all: $(kernel)

clean: 
	@rm -r build

run: $(iso)
	@qemu-system-x86_64 -cdrom $(iso)

$(iso): $(kernel) $(grub_cfg)
	@mkdir -p build/isofiles/boot/grub
	@cp $(kernel) build/isofiles/boot/kernel.bin
	@cp $(grub_cfg) build/isofiles/boot/grub
	@grub-mkrescue -o $(iso) build/isofiles 2> /dev/null
	@rm -r build/isofiles

$(kernel): $(assembly_object_files) $(linker_script)
	@ld -n -T $(linker_script) -o $(kernel) $(assembly_object_files)

# compile assembly files
build/architecture/$(architecture)/%.o: src/architecture/$(architecture)/%.asm
	@mkdir -p $(shell dirname $@)
	@nasm -felf64 $< -o $@
