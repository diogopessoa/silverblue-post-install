# Fedora Silverblue Post-Installation Script

A robust, streamlined, and automated post-installation script designed specifically for **Fedora Silverblue 44+**.


## 🚀 Key Features

* **Network Optimization:** Disables `NetworkManager-wait-online.service` to accelerate system boot times.
* **Typography:** Installs Microsoft-compatible Office fonts locally for perfect document compatibility.
* **Modern Aesthetics:** Automatically downloads, deploys, and configures the elegant **Hatter** icon theme, alongside GNOME interface refinements (weekday visibility, disabling hot corners, and a curated set of favorite dock applications).
* **Enhanced Management:** Deploys the [RPM-OSTree Manager](https://github.com/diogopessoa/rpm-ostree-manager) to simplify deployment rollbacks, updates, and package layer tracking.
* **Flatpak Migration:** Automatically purges default applications from the upstream Fedora Flatpak remotes and performs a clean migration to the official **Flathub** repository, bulk-installing essential modern software.


## 📦 Flathub Flatpak (replace Fedora Flatpak)

The script provisions a comprehensive suite of curated Flatpaks, including:
* **Productivity:** OnlyOffice Desktop Editors, GNOME Calendar, GNOME Contacts, Refine (Tweaks), LibreMenuEditor.
* **System Tools:** Extension Manager, Mission Center, CPU-X, Baobab (Disk Usage), Fedora MediaWriter, Ignition.
* **Media & Utilities:** G4Music, LocalSend, Loupe (Image Viewer), Papers (Document Viewer), Showtime (Video Player), Snapshot (Camera), SimpleScan, Smile (Emojis).
* **Theming Runtimes:** Adw-gtk3 and Adw-gtk3-dark for seamless GTK3 app integration.


## 🛠️ Usage Instructions

> [!WARNING]
> For security and profile scoping reasons, **do not run this script directly as `root` or via `sudo`**. The script will prompt you for administrative privileges (`sudo`) only when interacting with system services or system-wide Flatpak remotes.

1. Download the script:

```bash
curl -fsSL https://raw.githubusercontent.com/diogopessoa/silverblue-post-install/main/install.sh -o install.sh

```

2. Make the script executable:

```bash
chmod +x install.sh

```

3. Run the script:

```bash
./install.sh

```

4. Once the completion summary appears, **restart your system** to apply all changes!


## 📄 License

This project is open-source and available under the MIT License.

## Credits

- [Fedora Atomic Desktops](https://fedoraproject.org/pt-br/atomic-desktops/)
- [Flathub](https://flathub.org/)
