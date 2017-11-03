all:
	pandoc dorothy-report.md -o dorothy-report.docx  --bibliography=biblio-underworlds.bib --bibliography=biblio-pinsoro.bib --bibliography=biblio-freeplay.bib --bibliography=my-publications.bib  --reference-doc=eu-template-reference.docx
