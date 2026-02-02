#!/bin/bash
set -euo pipefail

echo "Installing dev tools via Nix profile..."

nix profile install \
  nixpkgs#ruby \
  nixpkgs#kamal \
  nixpkgs#nodejs \
  nixpkgs#bun \
  nixpkgs#php

echo "----------------------------------------"
ruby -v
kamal version
node -v
bun -v
php -v
echo "----------------------------------------"
echo "All tools installed via Nix profile"
