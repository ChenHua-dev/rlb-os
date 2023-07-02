BOOT:=./boot
HD_IMG:="hd.img"

all: ${BOOT}/boot.o
	bximage -q -hd=16 -func=create -sectsize=512 -imgmode=flat $(HD_IMG)
	dd if=${BOOT}/boot.o of=hd.img bs=512 seek=0 count=1 conv=notrunc

${BOOT}/boot.o: boot.asm
	$(shell mkdir boot)
	nasm boot.asm -o ${BOOT}/boot.o

clean:
	$(shell rm -rf ${BOOT})
	$(shell rm -rf $(HD_IMG))
