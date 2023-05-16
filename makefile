#

ASBIN=lwasm --6809 --format=decb

all: HELLO.BIN TESTASM.DSK update_asm dir

clean:
	rm -f HELLO.BIN

HELLO.BIN: helloworld.asm
	$(ASBIN) -o $@ $<

TESTASM.DSK:
	decb dskini $@

update_asm: HELLO.BIN TESTASM.DSK
	decb copy -r -2 HELLO.BIN TESTASM.DSK,$<

dir: TESTASM.DSK
	decb dir TESTASM.DSK

run_bin_in_xroar: HELLO.BIN
	xroar $<
