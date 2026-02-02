#!/bin/bash
set -euo pipefail

# Ensure ~/.local/bin is available
export PATH="$HOME/.local/bin:$PATH"

# Install mise if missing
if ! command -v mise >/dev/null 2>&1; then
  echo "Installing mise..."
  curl -fsSL https://mise.jdx.dev/install.sh | sh
fi

# Reload PATH after install
export PATH="$HOME/.local/bin:$PATH"

# Install Ruby build dependencies (Arch)
sudo pacman -S --needed --noconfirm \
  base-devel rust openssl libyaml libffi gdbm ncurses readline zlib libxml2 libxslt libxcrypt-compat

# Install Ruby globally
mise use -g ruby@latest

# If Ruby environment is correctly set up then this will work
echo "=== Installing Kamal CLI via gem ==="
gem install kamal

# Optional: other common dev tools
# mise use -g node@lts

# Enable mise in bash
if ! grep -q 'mise activate bash' "$HOME/.bashrc"; then
  echo 'eval "$(mise activate bash)"' >> "$HOME/.bashrc"
fi

echo "----------------------------------------"
echo "mise installed and configured"
mise --version
ruby -v
echo "Restart your terminal or run: source ~/.bashrc"
echo "----------------------------------------"
