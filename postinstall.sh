#!/bin/sh

set -e

export LANG=C
export LC_ALL=C

echo "Starting postinstall script..."

# Detect OS
if [ "$(uname)" = "Darwin" ]; then
    IS_MAC=true
else
    IS_MAC=false
fi

# Install Homebrew if on macOS and not already installed
if $IS_MAC; then
    if ! command -v brew >/dev/null 2>&1; then
        echo "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
fi

# Update package lists
echo "Updating package lists..."
if $IS_MAC; then
    brew update
else
    apt-get update
fi

# Install necessary packages
echo "Installing required packages..."
if $IS_MAC; then
    brew install \
        texlive \
        inkscape
else
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
fi

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
    
    # Check if user tree is initialized
    if ! tlmgr conf | grep -q "TEXMFHOME"; then
        echo "Initializing user tree..."
        tlmgr init-usertree
    fi
    
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
if $IS_MAC; then
    brew cleanup
else
    apt-get clean
    rm -rf /var/lib/apt/lists/*
fi

echo "Postinstall script completed successfully."