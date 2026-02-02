#!/bin/bash
set -euo pipefail

# Ensure ~/.local/bin is available
export PATH="$HOME/.local/bin:$PATH"

# Ensure base tools
sudo pacman -S --needed --noconfirm curl git

# Install mise if missing
if ! command -v mise >/dev/null 2>&1; then
  echo "Installing mise..."
  curl -fsSL https://mise.jdx.dev/install.sh | sh
fi

# Activate mise for this shell
eval "$(mise activate bash)"

# Optional global runtimes (example)
# mise use -g node@lts
# mise use -g bun@latest

# Enable mise automatically in bash
if ! grep -q 'mise activate bash' "$HOME/.bashrc"; then
  echo 'eval "$(mise activate bash)"' >> "$HOME/.bashrc"
fi

echo "----------------------------------------"
echo "mise installed and configured"
mise --version
echo "Restart your terminal or run: source ~/.bashrc"
echo "----------------------------------------"
