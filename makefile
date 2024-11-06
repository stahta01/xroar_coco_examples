#

ASBIN=lwasm --6809 --format=decb
DECB=decb
XROAR=xroar

TARGETASM=helloworld.asm
TARGETCBIN=HELLO.BIN
TARGETCDISK=TESTC.DSK
TARGET_C_FILE=hello.c
TARGET_OBJ_FILE=a.out
CC6809=cmoc --verbose

all: $(TARGETCBIN) run_bin_in_xroar

clean:
	rm -f $(TARGETCBIN)
	rm -f $(TARGETCDISK)

#$(TARGETBIN): $(TARGETASM)
#	$(ASBIN) -o $@ $<

$(TARGETCBIN): $(TARGET_C_FILE)
	$(CC6809) -o $@ $< 

$(TARGETCDISK):
	$(DECB) dskini $@

update_bin_on_disk: $(TARGETCBIN) $(TARGETCDISK)
	$(DECB) copy -r -2 $< $(TARGETCDISK),$<

dir: $(TARGETDISK)
	$(DECB) dir $<

run_bin_in_xroar: $(TARGETCBIN)
	$(XROAR) $<
