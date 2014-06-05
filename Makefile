# $Id: Makefile 36 2008-06-29 23:46:07Z lybrown $

drunk-chessboard-ntsc-hack.run:

atari = altirra

%.run: %.xex
	$(atari) $<

%.xex: %.obx
	cp $< $@

%.obx: %.asm
	xasm /t:$*.lab /l:$*.lst $<
	perl -pi -e 's/^n /  /' $*.lab

clean:
	rm -f *.{obx,lab,lst,xex} *~

.PRECIOUS: %.obx %.xex %.asm
