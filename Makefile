CC := xelatex
INPUT := srs.tex
OUTDIR := output
OUTPUT := $(OUTDIR)/srs.pdf

.PHONY: all
all: $(OUTPUT)

$(OUTPUT): $(OUTDIR)/srs.aux remake
	

$(OUTDIR)/srs.aux: $(INPUT)
	mkdir -p $(OUTDIR)
	$(CC) -output-directory=$(OUTDIR) $<

.PHONY: remake
remake: $(INPUT)
	rm -f $(OUTPUT)
	$(CC) -output-directory=$(OUTDIR) $<

	
.PHONY: clean
clean:
	rm -rf $(OUTDIR)/*.aux $(OUTDIR)/*.log $(OUTDIR)/*.out

.PHONY: mrproper
mrproper:
	rm -rf $(OUTDIR)
