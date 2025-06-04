#!/usr/bin/env bash
set -e

echo "Installing Hugo and Vale-compatible dependencies..."

# Install Hugo (only needed if Hugo is not pre-installed — usually is)
# hugo version

# Install project Node dependencies
npm install

# Install Vale using a portable script
echo "Installing Vale..."
curl -fsSL https://github.com/errata-ai/vale/releases/latest/download/vale_Linux_64-bit.tar.gz | tar -xz
mv vale /usr/local/bin/vale

# Confirm Vale is installed
vale --version

# Make sure Hugo modules are up to date
hugo mod get -u

echo "Setup complete."
