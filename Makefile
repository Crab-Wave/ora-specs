CC := latexmk -xelatex
INPUT := specifications.tex
OUTDIR := output
OUTPUT := $(OUTDIR)/specifications.pdf

.PHONY: all
all: $(OUTPUT)

$(OUTPUT): $(INPUT)
	mkdir -p $(OUTDIR)
	$(CC) -output-directory=$(OUTDIR) $<

.PHONY: clean
clean:
	rm -rf $(OUTDIR)/*.aux $(OUTDIR)/*.log $(OUTDIR)/*.out $(OUTDIR)/*.toc

.PHONY: mrproper
mrproper:
	rm -rf $(OUTDIR)
