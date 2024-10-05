#!/bin/sh

# Run the Pandoc command
pandoc markdown_input.md -o markdown_to_pdf_via_pandoc.pdf --template=latex.tex --pdf-engine=xelatex --listings --pdf-engine-opt=--shell-escape
