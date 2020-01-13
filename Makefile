CC := xelatex
INPUT := specifications.tex
OUTDIR := output
OUTPUT := $(OUTDIR)/specifications.pdf

.PHONY: all
all: $(OUTPUT)

$(OUTPUT): $(OUTDIR)/specifications.aux remake
	

$(OUTDIR)/specifications.aux: $(INPUT)
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
