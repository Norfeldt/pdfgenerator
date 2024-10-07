#!/bin/sh

set -e

export LANG=C
export LC_ALL=C

echo "Starting postinstall script..."

# Update package lists
echo "Updating package lists..."
apt-get update

# Install necessary packages
echo "Installing required packages..."
apt-get install -y \
    texlive-xetex \
    texlive-latex-extra \
    texlive-fonts-recommended \
    lmodern \
    texlive-lang-european \
    texlive-lang-french \
    texlive-science \
    texlive-pictures \
    fonts-inconsolata \
    inkscape

# Function to check if a LaTeX package is available
check_latex_package() {
    if kpsewhich "$1.sty" >/dev/null 2>&1; then
        echo "$1.sty is available."
        return 0
    else
        echo "$1.sty is not available."
        return 1
    fi
}

# Function to install a LaTeX package using tlmgr
install_latex_package() {
    echo "Attempting to install $1..."
    tlmgr init-usertree
    tlmgr install "$1"
    
    # Verify installation
    if check_latex_package "$1"; then
        echo "$1.sty has been successfully installed."
    else
        echo "Failed to install $1.sty. Please install it manually."
        return 1
    fi
}

# List of required LaTeX packages
required_packages="xstring datetime2"

# Check and install required packages
for package in $required_packages; do
    if ! check_latex_package "$package"; then
        install_latex_package "$package" || exit 1
    fi
done

# Clean up
echo "Cleaning up..."
apt-get clean
rm -rf /var/lib/apt/lists/*

echo "Postinstall script completed successfully."