#!/bin/bash

# Print Pandoc version (optional, for debugging)
pandoc --version

# Generate PDF from Markdown
pandoc body.md -o output.pdf --template=template.tex --pdf-engine=pdflatex --pdf-engine-opt=--shell-escape

# Notify when done
echo "PDF generated: output.pdf"

