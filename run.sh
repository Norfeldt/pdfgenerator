#!/bin/bash

# Run the Pandoc command
pandoc input.md -o output.pdf --template=template.tex --pdf-engine=xelatex --listings --pdf-engine-opt=--shell-escape
