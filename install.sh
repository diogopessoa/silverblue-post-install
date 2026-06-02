#!/usr/bin/env bash

# Author: Diogo Pessoa (https://github.com/diogopessoa/silverblue-post-install/)

set -euo pipefail

# ---------------- Verificação ---------------- 
if [[ $EUID -eq 0 ]]; then
  echo "    Run as a standard user: ./install.sh"
  exit 1
fi

# ---------------- Colors ----------------
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NC='\033[0m'

# ---------------- Sudo Keep-alive ----------------
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Status Variables
status_network="${RED} ✗${NC}"
status_fonts="${RED} ✗${NC}"
status_icons="${RED} ✗${NC}"
status_gnome="${RED} ✗${NC}"
status_manager="${RED} ✗${NC}"
status_flatpak="${RED} ✗${NC}"

echo ""
echo -e "${BLUE}╭────────────────────────────────────╮${NC}"
echo -e "${GREEN}│  ${BOLD}Fedora Silverblue Post-Install ${NC}${GREEN}  │${NC}"
echo -e "${BLUE}╰────────────────────────────────────╯${NC}"

# 1. ---------------- Disable Network wait-online ----------------
echo -e "\n▶ Disabling NetworkManager-wait-online.service..."
if sudo systemctl disable NetworkManager-wait-online.service 2>/dev/null; then
    status_network="${GREEN} ✓${NC}"
fi

# 2. ---------------- Office Fonts ----------------
echo -e "\n▶ Installing Office Fonts..."
FONTS_DIR="$HOME/.local/share/fonts/office_fonts"
TMP_ZIP="/tmp/office_fonts.zip"

mkdir -p "$FONTS_DIR"
if curl -fsSL https://raw.githubusercontent.com/diogopessoa/my-packages-lists/main/silverblue/office_fonts.zip -o "$TMP_ZIP"; then
    # Uses native Python to extract files
    python3 -c "import zipfile; zipfile.ZipFile('$TMP_ZIP').extractall('$FONTS_DIR')"
    fc-cache -f "$HOME/.local/share/fonts"
    status_fonts="${GREEN} ✓${NC}"
fi
rm -f "$TMP_ZIP"

# 3. ---------------- Hatter Icons Theme ----------------
echo -e "\n▶ Installing Hatter Icons..."
ICONS_DIR="$HOME/.local/share/icons"
HATTER_DIR="/tmp/Hatter_clone"

rm -rf "$HATTER_DIR"
if git clone --depth 1 https://github.com/Mibea/Hatter.git "$HATTER_DIR"; then
    mkdir -p "$ICONS_DIR"
    # Remove the previous version, if any, to avoid overwrite conflicts
    rm -rf "$ICONS_DIR/Hatter"
    cp -r "$HATTER_DIR/Hatter" "$ICONS_DIR/"
    gtk-update-icon-cache -f "$ICONS_DIR/Hatter" || true
    status_icons="${GREEN} ✓${NC}"
fi
rm -rf "$HATTER_DIR"

# 4. ---------------- GNOME Setup ---------------- 
echo -e "\n▶ Applying GNOME preferences for the current user......"
if gsettings set org.gnome.desktop.interface icon-theme 'Hatter' && \
   gsettings set org.gnome.desktop.interface clock-show-weekday true && \
   gsettings set org.gnome.desktop.interface enable-hot-corners false && \
   gsettings set org.gnome.shell favorite-apps "['org.gnome.Nautilus.desktop','org.gnome.Settings.desktop','org.gnome.Software.desktop','org.gnome.TextEditor.desktop','org.gnome.Calculator.desktop','org.onlyoffice.desktopeditors.desktop','com.brave.Browser.desktop']"; then
    status_gnome="${GREEN} ✓${NC}"
fi

# 5. ---------------- RPM-OSTree Manager ----------------
echo -e "\n▶ Installing RPM-OSTree Manager..."
if curl -fsSL https://raw.githubusercontent.com/diogopessoa/rpm-ostree-manager/main/install.sh | bash; then
    status_manager="${GREEN} ✓${NC}"
fi

# 6. ---------------- Flathub Flatpak ----------------
echo -e "\n▶ Starting Flatpak Flathub Migration..."
pkill -f gnome-software || true
flatpak config --system --set languages "pt" || true
sudo flatpak remote-add --if-not-exists --system flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# Cleanly retrieves the IDs of apps originating from the Fedora repository
apps_fedora=$(flatpak list --system --columns=application,origin | awk '$2 ~ /^fedora(-testing)?$/ {print $1}')

if [ -n "$apps_fedora" ]; then
    echo "Removing native Flatpaks from the Fedora repository..."
    # Performs batch removal instead of a single loop to speed up the process
    echo "$apps_fedora" | xargs sudo flatpak uninstall --system --assumeyes || true
fi

lista_apps=(
    com.brave.Browser
    com.github.neithern.g4music
    com.mattjakeman.ExtensionManager
    page.tesk.Refine
    page.codeberg.libre_menu_editor.LibreMenuEditor
    it.mijorus.smile
    io.github.flattool.Ignition
    io.missioncenter.MissionCenter
    io.github.thetumultuousunicornofdarkness.cpu-x    
    org.gnome.baobab
    org.gnome.Calculator
    org.gnome.Calendar
    org.gnome.clocks
    org.gnome.Contacts
    org.gnome.FileRoller
    org.gnome.Loupe
    org.gnome.Papers
    org.gnome.SimpleScan
    org.gnome.Snapshot
    org.gnome.Showtime
    org.gnome.TextEditor
    org.fedoraproject.MediaWriter    
    org.localsend.localsend_app
    org.gtk.Gtk3theme.adw-gtk3
    org.gtk.Gtk3theme.adw-gtk3-dark
    org.onlyoffice.desktopeditors
)

echo "Installing packages from Flathub..."
if flatpak install --system --assumeyes flathub "${lista_apps[@]}"; then
    sudo flatpak remote-delete fedora --force 2>/dev/null || true
    sudo flatpak remote-delete fedora-testing --force 2>/dev/null || true
    sudo flatpak uninstall --system --unused --assumeyes
    status_flatpak="${GREEN} ✓${NC}"
fi

# 7. ---------------- Summary of Conclusions ----------------
echo -e "\n"
echo "▶ Summary: " 
echo -e " $status_network Network wait-online"
echo -e " $status_fonts Office Fonts"
echo -e " $status_icons Hatter Icons Theme"
echo -e " $status_gnome GNOME Setup"
echo -e " $status_manager RPM-OSTree Manager"
echo -e " $status_flatpak Flatpak Migration to Flathub"
echo ""
echo -e "${BLUE}${BOLD} Restart the system to apply all changes!${NC}"
read -rp " Press Enter to close..."
echo ""
