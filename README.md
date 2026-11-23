### 📸 Visual Showcase

<div align="center">
  <img src="./assets/main.png" alt="Main Neovim Setup" width="100%" />
</div>

<details>
<summary><strong>Click to view more screenshots</strong></summary>
<br/>

| View 1 | View 2 |
| :---: | :---: |
| <img src="./assets/telescope.png" alt="Neovim View 1" width="100%" /> | <img src="./assets/termux.png" alt="Neovim View 2" width="100%" /> |

</details>

# 🚀 Personal Neovim Configuration
![Neovim](https://shields.io)
![Lua](https://shields.io)
![Platform](https://shields.io)

A modern, cross-platform, IDE-grade Neovim configuration built for speed, competitive programming, and software development. Designed to deploy seamlessly across desktop Linux environments (such as CachyOS/Arch) and mobile terminal setups (Termux on Android) using a single universal installation script.

---

## ✨ Key Features

* **Universal Portability:** One-command deployment via a smart `install.sh` script that automatically detects paths, creates missing directories, and safely backs up existing setups.
* **Symlink Architecture:** Links the cloned repository directly to `~/.config/nvim`, allowing instant updates across all devices with a simple `git pull`.
* **IDE-Grade Tooling:** Pre-configured with **LazyVim / `lazy.nvim`**, **Telescope** (fuzzy finding), **Tree-sitter** (syntax parsing & highlighting), **Catppuccin** colorscheme, indent guides, a built-in code runner, and **LeetCode (`leetcode.nvim`)** integration.

---

## 📋 Prerequisites

Before running the setup, ensure you have the following core dependencies installed on your system:

* **Neovim** (`v0.9.0` or higher)
* **Git**
* **C Compiler** (`gcc` or `clang`) — *Required for compiling Tree-sitter parsers*
* **Ripgrep (`rg`) & `fd`** — *Required for Telescope live grep and fast file searching*
* **`curl`** — *Required for plugin downloads and `leetcode.nvim`*
* **A Nerd Font** — *Required in your terminal emulator for file icons and UI glyphs*

### Quick Dependency Installation

**Arch Linux / CachyOS:**
```bash
sudo pacman -S neovim git base-devel ripgrep fd curl
```

**Ubuntu / Debian:**
```bash
sudo apt update && sudo apt install -y neovim git build-essential ripgrep fd-find curl
```

**Android (Termux):**
```bash
pkg update && pkg install -y neovim git clang ripgrep fd curl
```

---

## 🛠️ Universal Installation

Follow these steps to deploy this configuration on any new machine or phone:

### 1. Clone the Repository
```bash
git clone https://github.com ~/nvim-config
```

### 2. Run the Installer Script
```bash
chmod +x ~/nvim-config/install.sh
~/nvim-config/install.sh
```

#### What `install.sh` does under the hood:
1. Automatically resolves the exact directory where the repository was cloned.
2. Ensures `~/.config` exists (crucial for fresh Termux or minimal Linux installations).
3. Checks for any pre-existing Neovim configuration at `~/.config/nvim` and safely moves it to a timestamped backup (`~/.config/nvim.backup.YYYYMMDD_HHMMSS`).
4. Creates a symbolic link (`ln -s`) from the cloned repo to `~/.config/nvim`.

### 3. Bootstrap Plugins
Launch Neovim for the first time:
```bash
nvim
```
Your plugin manager will automatically open and download all configured plugins. Allow all progress bars to complete before closing.

---

## 📱 Termux (Android) Specific Setup

If you are deploying this configuration on an Android device using Termux, complete these two extra steps after running `install.sh`:

1. **Create the Neovim cache directory** (prevents startup crashes for plugins like `leetcode.nvim`):
   ```bash
   mkdir -p ~/.cache/nvim
   ```
2. **Verify system health inside Neovim:**
   Open `nvim` and run `:checkhealth` to confirm all parsers and CLI tools (`rg`, `fd`, `clang`) are detected properly.

---

## 🔄 Keeping Devices in Sync

Because `install.sh` uses a symlink, keeping your desktop and phone synchronized requires zero re-installation:

* **Push changes from your primary machine:**
  ```bash
  cd ~/.config/nvim
  git add .
  git commit -m "Update Neovim configuration"
  git push
  ```
* **Pull updates onto any other device:**
  ```bash
  git -C ~/nvim-config pull
  ```
  *(Restart Neovim to apply any newly added plugins).*

---

## 🩺 Troubleshooting

* **Plugins fail to build on first launch:** Open Neovim, run `:Lazy`, highlight the failed plugin, and press `gb` (Build) or `U` (Update).
* **Broken icons or missing symbols:** Make sure your terminal emulator (or Termux styling app) is using a patched **Nerd Font** (e.g., *JetBrainsMono Nerd Font* or *FiraCode Nerd Font*).
* **Check overall setup status:** Run `:checkhealth` inside Neovim for detailed diagnostics.
