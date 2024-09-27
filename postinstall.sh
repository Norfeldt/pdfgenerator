#!/bin/sh

# Update package lists
apt-get update

# Install TeX Live and required LaTeX packages
apt-get install -y --no-install-recommends \
    texlive-latex-base \
    texlive-latex-extra \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-xetex

# Install Inkscape
apt-get install -y inkscape

# Install additional LaTeX packages used in template.tex
tlmgr install \
    fancyhdr \
    geometry \
    lastpage \
    hyperref \
    xcolor \
    enumitem \
    svg \
    ifthen

# Make the run.sh script executable
chmod +x /workspace/run.sh

echo "Installation complete!"