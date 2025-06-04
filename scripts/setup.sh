#!/usr/bin/env bash
set -e

echo "Installing Hugo and Vale-compatible dependencies..."

# Install Hugo (only needed if Hugo is not pre-installed — usually is)
# hugo version

# Install project Node dependencies
npm install

# Install Vale using a portable script
# Install Vale (portable binary)
mkdir -p .bin
curl -fsSL https://github.com/errata-ai/vale/releases/latest/download/vale_Linux_64-bit.tar.gz | tar -xz -C .bin
chmod +x .bin/vale
echo 'export PATH="$PWD/.bin:$PATH"' >> ~/.bashrc

# Add to current PATH so this shell can use it right away
export PATH="$PWD/.bin:$PATH"

vale --version

# Make sure Hugo modules are up to date
hugo mod get -u

echo "Setup complete."
