GPPPARAMS = -m32 -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore
ASPARAMS = --32
LDPARAMS = -melf_i386

objects = loader.o kernel.o

%.o: %.cpp
	g++ $(GPPPARAMS) -o $@ -c $<


%.o: %.s
	as $(ASPARAMS) -o $@ $<

barca.bin: linker.ld $(objects)
		ld $(LDPARAMS) -T $< -o $@ $(objects)

install: barca.bin
		sudo cp $< /boot/barca.bin

barca-i386.iso: barca.bin
		mkdir iso
		mkdir iso/boot
		mkdir iso/boot/grub
		cp $< iso/boot/
		echo 'set timeout = 0' > iso/boot/grub/grub.cfg
		echo 'set default = 0' >> iso/boot/grub/grub.cfg
		echo '' >> iso/boot/grub/grub.cfg
		echo 'menuentry "Barca OS" {' >> iso/boot/grub/grub.cfg
		echo '    multiboot /boot/barca.bin' >> iso/boot/grub/grub.cfg
		echo '    boot' >> iso/boot/grub/grub.cfg
		echo '}' >> iso/boot/grub/grub.cfg
		grub-mkrescue --output=$@ iso
		rm -rf iso