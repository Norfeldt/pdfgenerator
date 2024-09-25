#!/bin/bash

# Check if Pandoc is installed
if ! command -v pandoc &> /dev/null; then
    echo "Pandoc could not be found. Please install it."
    exit 1
fi

# Generate PDF from Markdown
pandoc body.md -o output.pdf --template=template.tex --pdf-engine=pdflatex --pdf-engine-opt=--shell-escape

# Notify when done
echo "PDF generated: output.pdf"

