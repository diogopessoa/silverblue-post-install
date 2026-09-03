<p align="center">
  <img src="https://raw.githubusercontent.com/diogopessoa/silverblue-post-install/main/FILES/silverblue-postinstall-banner.png" alt="Fedora Silverblue Post-Installation Banner" width="100%" style="border-radius: 8px;">
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Fedora-Atomic%20OS-blue?style=for-the-badge&logo=fedora&logoColor=white" alt="Fedora OS">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License">
</p>

**Silverblue-Post-Installation** is a quick, basic configuration script for Fedora Silverblue end-users. Tested on Silverblue 44, and compatible with older and newer versions as well.


## What the script does

1. **Disables `NetworkManager-wait-online.service`**  
   Speeds up boot time by removing the network wait delay.

2. **Office fonts**  
   Adds local Microsoft-compatible fonts for better document compatibility.

3. **Hatter icon theme**  
   Downloads and applies the Hatter icon theme for a cleaner desktop look.

4. **Migrates Flatpaks to Flathub**  
   Removes Fedora Flatpak remotes, adds Flathub, and installs a curated set of essential Flatpaks.

## Flatpaks included

The script installs a curated set of Flatpaks Flathub, including:

- Brave
- OnlyOffice
- LocalSend
- GNOME apps
- System utilities
- GTK themes

## Screenshot

<p align="center">
  <img src="https://raw.githubusercontent.com/diogopessoa/silverblue-post-install/main/FILES/screenshot-fedora-desktop.png" alt="Fedora Silverblue Post-Installation Banner" width="100%" style="border-radius: 8px;">
</p>

## Usage Instructions

Download and run the script from the terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/diogopessoa/silverblue-post-install/main/install.sh -o install.sh
chmod +x install.sh
./install.sh
```

The script will request `sudo` only when needed. Do not run it as root.

## Notes

- Flatpak installations are performed system-wide using `--system`.
- Fedora and Fedora Testing Flatpak remotes are removed after migration.
- A system reboot is required to apply all changes.

```bash
systemctl reboot
```

## License

[MIT License](https://github.com/diogopessoa/silverblue-post-install/blob/main/LICENSE)

## Credits

- [Fedora Atomic Desktops](https://fedoraproject.org/pt-br/atomic-desktops/)
- [Flathub](https://flathub.org/)
- [Hatter](https://github.com/Mibea/Hatter)

