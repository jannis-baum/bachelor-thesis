OUT=thesis

MD_FILES=$(wildcard chapters/*.md)
TEXT=$(MD_FILES) $(wildcard template/*) $(wildcard meta/*) $(wildcard style/*) bibliography.bib

IMG_DIR=images
IMGS=$(wildcard $(IMG_DIR)/*)
PDF_IMGS=$(subst .svg,.pdf,$(wildcard $(IMG_DIR)/*.svg))

PANDOC_CMD=pandoc --defaults=template/options.yaml

$(OUT).pdf: $(TEXT) $(IMGS) $(PDF_IMGS)
	@echo 'creating pdf'
	@$(PANDOC_CMD) --output=$(OUT).pdf $(MD_FILES)
	@qlmanage -p $(OUT).pdf &>/dev/null

$(OUT).tex: $(TEXT)
	@$(PANDOC_CMD) --output=$(OUT).tex $(MD_FILES)
	@vim $(OUT).tex

# create pdfs from figma svgs and delete svgs
$(IMG_DIR)/%.pdf: $(IMG_DIR)/%.svg
	@inkscape $< --export-area-drawing --batch-process --export-type=pdf --export-filename=$@
	@rm $<

.PHONY: clean
clean:
	@rm -f $(OUT).pdf $(OUT).tex
