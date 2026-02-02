#!/bin/bash
set -o pipefail

# UPDATE
sudo pacman -Syu --noconfirm

# BASE
SYSTEM_BASE="ca-certificates which wget rsync git dmidecode usbutils"

# x11
GRAPHICS="xorg-server xorg-xinit dbus mesa"

# GUI
DESKTOP="openbox xterm pcmanfm gvfs xdg-utils xdg-user-dirs"

# DEV & TERM
DEV_TOOLS="neovim ripgrep python jq direnv bash-completion xclip htop"
# alacritty

# FONTS & FILES
FILES_FONTS="zip unzip ttf-liberation ttf-dejavu"

# OTHER APPS
BROWSER="firefox"

sudo pacman -S --needed --noconfirm $SYSTEM_BASE $GRAPHICS $DESKTOP $DEV_TOOLS $FILES_FONTS $BROWSER

xdg-user-dirs-update

# OPENBOX CONFIG
mkdir -p ~/.config/openbox


cat <<EOF > ~/.xinitrc
if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; then
    [ -x "\$f" ] && . "\$f"
  done
  unset f
fi

exec openbox-session
EOF

cat <<EOF > ~/.config/openbox/menu.xml
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