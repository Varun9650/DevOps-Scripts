#!/bin/bash

# Docker Installation Script Wrapper

echo "📥 Downloading Docker install script..."
curl -fsSL https://get.docker.com -o install-docker.sh || {
  echo "❌ Failed to download install script."
  exit 1
}

echo "📄 Verifying script content..."
head -n 10 install-docker.sh
echo "...(script truncated)"

echo ""
echo "🧪 Running the script with --dry-run first to show steps:"
sh install-docker.sh --dry-run

echo ""
read -p "❓ Do you want to proceed with actual Docker installation? (y/n): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo "🚀 Installing Docker..."
  sudo sh install-docker.sh
  echo "✅ Docker installation completed."
else
  echo "❌ Installation cancelled."
fi
