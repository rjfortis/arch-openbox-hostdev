#!/bin/bash
set -euo pipefail

nix-env -iA nixpkgs.ruby

cat <<EOF >> ~/.bashrc

# Ruby/Gems path for Nix
export GEM_HOME="\$HOME/.gem/ruby"
export PATH="\$GEM_HOME/bin:\$PATH"
EOF

export GEM_HOME="$HOME/.gem/ruby"
export PATH="$GEM_HOME/bin:$PATH"

# Kamal
gem install kamal