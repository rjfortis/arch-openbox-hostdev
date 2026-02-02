#!/bin/bash
set -euo pipefail

echo "Installing development tools via nix profile..."

nix profile add nixpkgs#ruby nixpkgs#kamal nixpkgs#nodejs nixpkgs#bun nixpkgs#php

sleep 2

echo "----------------------------------------"
echo "Nix profile packages installed:"
nix profile list
echo "----------------------------------------"
