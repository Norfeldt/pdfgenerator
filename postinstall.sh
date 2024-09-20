#!/bin/sh

# Update package list and install git
apt-get update && apt-get install -y git

# Install the necessary LaTeX packages
tlmgr install tocloft minted booktabs amssymb longtable

# Make the run.sh script executable
chmod +x /workspace/run.sh
