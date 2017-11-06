SVG=$(wildcard figs/*.svg)

%.png: %.svg
	inkscape -d 200 --export-png $(@) $(<)


all: $(SVG:.svg=.png) 
	pandoc dorothy-report.md -McodeBlockCaptions=true -MfigureTitle=Figure -MtableTitle=Table -MlistingTitle=Listing -F pandoc-crossref -F pandoc-citeproc -o dorothy-report.docx  --bibliography=biblio-underworlds.bib --bibliography=biblio-pinsoro.bib --bibliography=biblio-freeplay.bib --bibliography=my-publications.bib  --reference-doc=eu-template-reference.docx
