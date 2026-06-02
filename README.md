<p align="center">
  <img src="https://raw.githubusercontent.com/diogopessoa/silverblue-post-install/main/FILES/silverblue-postinstall-banner.png" alt="Fedora Silverblue Post-Installation Banner" width="100%" style="border-radius: 8px;">
</p>


<p align="center">
  <img src="https://img.shields.io/badge/Fedora-Atomic%20OS-blue?style=for-the-badge&logo=fedora&logoColor=white" alt="Fedora OS">
  <img src="https://img.shields.io/badge/License-MIT-green?style=for-the-badge" alt="MIT License">
</p>


An automated post-installation script for **Fedora Silverblue**. Tested on Fedora Silverblue 44, but also compatible with previous versions.


## 🚀 Key Features

* **Network Optimization:** Disables `NetworkManager-wait-online.service` to accelerate system boot times.
* **Typography:** Installs Microsoft-compatible Office fonts locally for perfect document compatibility.
* **Modern Aesthetics:** Automatically downloads, deploys, and configures the elegant [Hatter](https://github.com/Mibea/Hatter) icon theme, alongside GNOME interface refinements (weekday visibility, disabling hot corners, and a curated set of favorite dock applications).
* **Enhanced Management:** Deploys the [RPM-OSTree Manager](https://github.com/diogopessoa/rpm-ostree-manager) to simplify deployment rollbacks, pin/unpin deployment and package layer tracking.
* **Flatpak Migration:** Automatically purges default applications from the upstream Fedora Flatpak remotes and performs a clean migration to the official [Flathub](https://flathub.org/) repository, bulk-installing essential modern software.


## 📦 Flathub Flatpak (replace Fedora Flatpak)

The script provisions a comprehensive suite of curated Flatpaks, including:
* **Productivity:** OnlyOffice Desktop Editors, GNOME Calendar, GNOME Contacts, Refine (Tweaks), LibreMenuEditor.
* **System Tools:** Extension Manager, Mission Center, CPU-X, Baobab (Disk Usage), Fedora MediaWriter, Ignition.
* **Media & Utilities:** Gapless (Music), LocalSend (share files), Loupe (Image Viewer), Papers (Document Viewer), Showtime (Video Player), Snapshot (Camera), SimpleScan, Smile (Emojis).
* **Theming Runtimes:** Adw-gtk3 and Adw-gtk3-dark for seamless GTK3 app integration.


Aqui está uma versão revisada e polida do seu trecho do `README.md`.

A principal melhoria foi na seção do método puramente gráfico (GUI). Blocos de código em Markdown (usando triple backticks `````) devem ser reservados apenas para comandos de terminal ou blocos de código reais. Para instruções passo a passo textuais, o uso de listas estruturadas (Bullet Points) com formatação em negrito torna a leitura muito mais fluida e profissional.


## 🛠️ Usage Instructions

> [!WARNING]
> For security and profile scoping reasons, **do not run this script directly as `root` or via `sudo`**. The script will prompt you for administrative privileges (`sudo`) only when interacting with system services or system-wide Flatpak remotes.

### Option 1: Via Terminal

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


### Option 2: Graphical User Interface (GUI)


* **Download:** Navigate to the `install.sh` file on GitHub and click the **Download raw file** icon.
* **Permissions:** Open your file manager, locate the downloaded `install.sh` file, right-click it, and select **Properties**. Under the permissions tab, check the **Allow executing file as program** box.
* **Execution:** Right-click the file once more and select **Run as a Program**.



## 📄 License

This project is open-source and available under the MIT License.

## Credits

- [Fedora Atomic Desktops](https://fedoraproject.org/pt-br/atomic-desktops/)
- [Flathub](https://flathub.org/)
