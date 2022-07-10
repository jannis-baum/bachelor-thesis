OUT=thesis
MD_FILES=$(wildcard chapters/*)
PANDOC_CMD=pandoc \
		   --template=tex/thesis.tex \
		   --top-level-division=chapter \
		   --bibliography=bibliography.bib \
		   --citeproc

.PHONY: pdf tex clean

pdf:
	@echo 'creating pdf'
	@$(PANDOC_CMD) --output=$(OUT).pdf $(MD_FILES)
	@qlmanage -p $(OUT).pdf &>/dev/null

tex:
	@$(PANDOC_CMD) --output=$(OUT).tex $(MD_FILES)
	@vim $(OUT).tex

clean:
	@rm -f $(OUT).pdf $(OUT).tex
