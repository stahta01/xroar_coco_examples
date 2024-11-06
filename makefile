#

ASBIN=lwasm --6809 --format=decb
DECB=decb
XROAR=xroar

TARGETASM=helloworld.asm
TARGETBIN=HELLO.BIN
TARGETDISK=TESTASM.DSK
TARGET_C_FILE=hello.c
TARGET_OBJ_FILE=a.out
CC6809=cmoc --verbose

all: $(TARGETBIN) run_bin_in_xroar

clean:
	rm -f $(TARGETBIN)

#$(TARGETBIN): $(TARGETASM)
#	$(ASBIN) -o $@ $<

$(TARGETBIN): $(TARGET_C_FILE)
	$(CC6809) -o $@ $< 

$(TARGETDISK):
	$(DECB) dskini $@

update_bin_on_disk: $(TARGETBIN) $(TARGETDISK)
	$(DECB) copy -r -2 $< $(TARGETDISK),$<

dir: $(TARGETDISK)
	$(DECB) dir $<

run_bin_in_xroar: $(TARGETBIN)
	$(XROAR) $<
