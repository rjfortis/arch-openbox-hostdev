#!/bin/bash
set -euo pipefail

# Install Ruby + Kamal via Nix profile
nix profile install nixpkgs#ruby nixpkgs#kamal

echo "----------------------------------------"

ruby -v

kamal version

echo "Ruby and Kamal installed via Nix profile"

echo "----------------------------------------"