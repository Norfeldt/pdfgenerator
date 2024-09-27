#!/bin/bash

# Print Pandoc version (optional, for debugging)
pandoc --version

# Convert SVG to PDF
inkscape logo.svg --export-filename=logo.pdf

# Print the contents of the current directory
echo "Contents of the current directory:"
ls -la

# Generate PDF from Markdown
pandoc input.md -o output.pdf --template=template.tex --pdf-engine=xelatex --pdf-engine-opt=-shell-escape --verbose

# Notify when done
echo "PDF generation attempt completed. Check for output.pdf or error messages above."

