#!/bin/bash
set -euo pipefail

echo "Installing development tools via nix profile..."

nix profile add nixpkgs#ruby nixpkgs#kamal nixpkgs#nodejs nixpkgs#bun nixpkgs#php nixpkgs#opencode

sleep 2

nix profile add nixpkgs#claude-code --impure

echo "----------------------------------------"
echo "Nix profile packages installed:"
nix profile list
echo "----------------------------------------"
