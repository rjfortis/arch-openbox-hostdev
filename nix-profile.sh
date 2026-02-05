#!/bin/bash
set -euo pipefail

echo "Installing development tools via nix profile..."

nix profile add nixpkgs#ruby nixpkgs#kamal nixpkgs#php nixpkgs#opencode nixpkgs#gemini-cli-bin

# nixpkgs#bun nixpkgs#nodejs

# USAGE: opencode claude gemini

sleep 2

nix profile add nixpkgs#claude-code --impure

echo "----------------------------------------"
echo "Nix profile packages installed:"
nix profile list
echo "----------------------------------------"
