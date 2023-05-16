#

ASBIN=lwasm --6809 --format=decb
DECB=decb
XROAR=xroar

TARGETASM=helloworld.asm
TARGETBIN=HELLO.BIN
TARGETDISK=TESTASM.DSK


all: $(TARGETBIN) run_bin_in_xroar

clean:
	rm -f $(TARGETBIN)

$(TARGETBIN): $(TARGETASM)
	$(ASBIN) -o $@ $<

$(TARGETDISK):
	$(DECB) dskini $@

update_asm_on_disk: $(TARGETBIN) $(TARGETDISK)
	$(DECB) copy -r -2 $< $(TARGETDISK),$<

dir: $(TARGETDISK)
	$(DECB) dir $<

run_bin_in_xroar: $(TARGETBIN)
	$(XROAR) $<
