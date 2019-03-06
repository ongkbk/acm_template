FYLE=base
FINAL=final

pdf:
	pdflatex $(FYLE)

bbl:	
	pdflatex $(FYLE)
	bibtex $(FYLE)
	pdflatex $(FYLE)
	pdflatex $(FYLE)

final:	pdf bbl
	./latexpand --expand-bbl p.bbl p.tex > $(FINAL).tex
	pdflatex $(FINAL)
	pdflatex $(FINAL)
	pdflatex $(FINAL)


clean:
	rm -f *~ *.bak *.log *.blg *.aux

# SUBMISSION=sub
# submission:
# 	./latexpand --expand-bbl p.bbl p.tex > ${SUBMISSION}.tex
# 	pdflatex ${SUBMISSION}.tex ; pdflatex ${SUBMISSION}.tex
# 	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/printer -dEmbedAllFonts=true -dNOPLATFONTS -sOutputFile=/tmp/${SUBMISSION}.pdf -f ${SUBMISSION}.pdf
# 	mv /tmp/${SUBMISSION}.pdf .
# 	acroread -toPostScript ${SUBMISSION}.pdf
