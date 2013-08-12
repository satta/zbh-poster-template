all:poster.pdf

TEXFILES=poster.tex

PDFS=streams.pdf\
     ltrhstreams.pdf\
     ltr.pdf\
     clusterjoining.pdf\
     ltrsift_overview.pdf\
     workflow.pdf\
     graphs.pdf


poster.pdf:${TEXFILES} poster.bib ${PDFS}
	pdflatex ${TEXFILES}
	bibtex poster
	pdflatex ${TEXFILES}
	pdflatex ${TEXFILES}


%.pdf:Graphics/%.svg
	inkscape -z --export-pdf=$@ $<

spell:${TEXFILES}
	@cat ${TEXFILES} | ispell -l -t -d american |\
	sed -e 's/\"\([aouAOU]\)/\1\"/g' |\
	sort -u

clean:
	rm -f poster.aux poster.dvi poster.log poster.nav poster.out poster.pdf
	rm -f *bbl *blg *toc *aux *vrb *snm
	rm -f ${PDFS}
