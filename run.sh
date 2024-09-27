#!/bin/bash

# Print Pandoc version (optional, for debugging)
pandoc --version

# Convert SVG to PDF only if necessary
if [ ! -f logo.pdf ] || [ logo.svg -nt logo.pdf ]; then
    rsvg-convert -f pdf -o logo.pdf logo.svg
    qpdf --object-streams=disable --linearize logo.pdf logo_normalized.pdf && mv logo_normalized.pdf logo.pdf
    exiftool -all:all= logo.pdf
fi

# Print the contents of the current directory
echo "Contents of the current directory:"
ls -la

# Generate PDF from Markdown
pandoc input.md -o output.pdf --template=template.tex --pdf-engine=xelatex --pdf-engine-opt=-shell-escape --verbose

# Notify when done
echo "PDF generation attempt completed. Check for output.pdf or error messages above."

