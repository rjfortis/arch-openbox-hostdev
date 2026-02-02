#!/bin/bash
set -euo pipefail

BASHRC="$HOME/.bashrc"


# UPDATE
sudo pacman -Syu --noconfirm

# BASE
# x11
# GUI
# DEV & TERM
# FONTS & FILES
# OTHER APPS

PACKAGES=(
  ca-certificates which wget rsync git dmidecode usbutils
  xorg-server xorg-xinit dbus mesa
  openbox xterm pcmanfm gvfs xdg-utils xdg-user-dirs
  neovim ripgrep python jq direnv bash-completion xclip htop
  zip unzip ttf-liberation ttf-dejavu
  firefox
)

sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"

sleep 10

command -v xdg-user-dirs-update >/dev/null && xdg-user-dirs-update


# Bash completion
if ! grep -q "bash-completion/bash_completion" "$BASHRC" 2>/dev/null; then
cat >> "$BASHRC" <<'EOF'

# Bash completion
if [ -r /usr/share/bash-completion/bash_completion ]; then
  source /usr/share/bash-completion/bash_completion
fi
EOF
fi

# xinitrc & OPENBOX CONFIG
mkdir -p ~/.config/openbox

[ -f ~/.xinitrc ] && cp ~/.xinitrc ~/.xinitrc.bak

cat <<'EOF' > ~/.xinitrc
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

exec openbox-session
EOF

# Backup existing menu if present
[ -f ~/.config/openbox/menu.xml ] && \
  cp ~/.config/openbox/menu.xml ~/.config/openbox/menu.xml.bak

cat <<'EOF' > ~/.config/openbox/menu.xml
<?xml version="1.0" encoding="UTF-8"?>
<openbox_menu xmlns="http://openbox.org/3.4/menu">

<menu id="root-menu" label="Openbox 3">
  <item label="Firefox">
    <action name="Execute"><execute>firefox</execute></action>
  </item>
  <item label="Terminal (xterm)">
    <action name="Execute"><execute>xterm</execute></action>
  </item>
  <item label="PCManFM">
    <action name="Execute"><execute>pcmanfm</execute></action>
  </item>

  <separator />

  <item label="Reconfigure">
    <action name="Reconfigure" />
  </item>
  <item label="Exit">
    <action name="Exit" />
  </item>
</menu>

</openbox_menu>
EOF
