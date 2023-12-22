.PHONY:clean

VERILATOR = verilator

OUTDIR=out
VERILATOR_FLAGS =  -Wall -top top -Mdir $(OUTDIR) -cc -binary -build -j 2

default: run

run: print.c top.v  ledloop.v led_adaptor.v
	$(VERILATOR) $(VERILATOR_FLAGS) $^
	./$(OUTDIR)/Vtop

clean:
	-rm -rf $(OUTDIR)
