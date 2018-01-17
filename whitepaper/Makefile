btch.pdf: btch.tex btch.bib
	$(MAKE) pdf

LATEX=pdflatex

.PHONY: pdf
pdf:
	printf '\\renewcommand{\\docversion}{Version %s}' "$$(git describe --tags --abbrev=6)" |tee btch.ver
	# If $(LATEX) fails, touch an input so that 'make' won't think it is up-to-date next time.
	rm -f btch.aux btch.bbl btch.blg btch.brf btch.bcf
	$(LATEX) btch.tex
	biber btch
	$(LATEX) btch.tex
	$(LATEX) btch.tex
	$(LATEX) btch.tex 
.PHONY: clean
clean:
	rm -f btch.dvi btch.pdf btch.bbl btch.blg btch.brf btch.toc btch.aux btch.out btch.log btch.bcf btch.run.xml btch.ver
