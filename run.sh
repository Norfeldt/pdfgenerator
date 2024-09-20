#!/bin/sh

# Run the Pandoc command
pandoc input.md -o output.pdf --template=template.tex --toc --pdf-engine=xelatex --no-highlight
