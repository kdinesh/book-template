FILES=$$(ls *.tex | grep -i lecture)

all:
	# Converts all lectures to all-in-one mode
	sed -i 's/thislecturealone{1}/thislecturealone{0}/' lecture*.tex
	pdflatex main.tex
	# Reverting it back
	sed -i 's/thislecturealone{0}/thislecturealone{1}/' lecture*.tex

clean:
	rm -f *.aux *.log *.toc *.scr

distclean:clean
	rm -f *.bbl *.blg main.pdf

bib:
	# Converts all lectures to all-in-one mode
	sed -i 's/thislecturealone{1}/thislecturealone{0}/' lecture*.tex
	pdflatex main.tex
	bibtex main
	pdflatex main.tex
	pdflatex main.tex
	# Reverting it back
	sed -i 's/thislecturealone{0}/thislecturealone{1}/' lecture*.tex

fix:
	sed -i 's/thislecturealone{0}/thislecturealone{1}/' lecture*.tex


induvidual:
	@for f in $(FILES) ; do \
	pdflatex $$f ; \
	done
