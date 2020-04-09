pdfs: problem.pdf
	pandoc PROBLEM.MD --pdf-engine=pdflatex --highlight-style tango -V 'fontfamily:dejavu' -V geometry:margin=1in -o problem.pdf