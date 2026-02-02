#!/bin/bash
set -euo pipefail

# Ensure base tools
sudo pacman -S --needed --noconfirm curl git

# Install mise if missing
if ! command -v mise >/dev/null 2>&1; then
  echo "Installing mise..."
  curl -fsSL https://mise.jdx.dev/install.sh | sh
fi

# Enable mise automatically in bash
if ! grep -q 'mise activate bash' "$HOME/.bashrc"; then
  # eval "$(/home/username/.local/bin/mise activate bash)"
  # echo 'eval "$(mise activate bash)"' >> "$HOME/.bashrc"
fi

source ~/.bashrc

echo "----------------------------------------"
echo "mise installed and configured"
mise --version
echo "Restart your terminal or run: source ~/.bashrc"
echo "----------------------------------------"
