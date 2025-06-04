#!/usr/bin/env bash
set -e

echo "🔧 Installing Hugo + dependencies..."

# Install dependencies
brew install go || true
brew install hugo || true
brew install npm || true
npm install

# Update Hugo modules (Docsy theme, etc.)
hugo mod get -u

echo "✅ Setup complete."
