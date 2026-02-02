#!/usr/bin/env bash
set -euo pipefail

SCRIPTS=(
  "init.sh"
  "docker.sh"
  "nix.sh"
  "nix-profile.sh"
  "tailscale.sh"
  "lazyvim.sh"
)

echo "======================================"
echo " System setup started"
echo "======================================"

for script in "${SCRIPTS[@]}"; do
  if [[ ! -f "$script" ]]; then
    echo "❌ Error: $script not found"
    exit 1
  fi

  echo "--------------------------------------"
  echo "▶ Running $script"
  echo "--------------------------------------"

  chmod +x "$script"
  ./"$script"
done

echo "======================================"
echo " System setup completed successfully ✅"
echo "======================================"
sleep 5
reboot