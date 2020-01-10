CC = xelatex
DIR = $(shell pwd)
SRCS = $(shell find $(DIR) -name '*.tex')
OUTPUT_DIR = output

$(shell mkdir -p $(OUTPUT_DIR))

pdf: $(DIR)/srs.tex $(SRCS)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -rf $(OUTPUT_DIR)/*.pdf
