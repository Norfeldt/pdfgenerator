#!/bin/sh

# Update package lists
apt-get update

# Install necessary packages
apt-get install -y \
    texlive-xetex \
    texlive-latex-extra \
    texlive-fonts-recommended \
    lmodern \
    texlive-lang-european \
    texlive-lang-french \
    texlive-science \
    texlive-pictures \
    inkscape

# Clean up
apt-get clean
rm -rf /var/lib/apt/lists/*