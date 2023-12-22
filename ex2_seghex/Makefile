.PHONY:clean

VERILATOR = verilator

OUTDIR=out
VERILATOR_FLAGS = -Wall  -top top -Mdir $(OUTDIR) -cc -binary -build -j 2

default: run

run: print.c top.v  seg.v seg_adaptor.v
	$(VERILATOR) $(VERILATOR_FLAGS) $^
	./$(OUTDIR)/Vtop

rc:  #restore cursor visibility
	@echo -ne "\x1b[?25h"

clean:
	-rm -rf $(OUTDIR)
