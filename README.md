# ⚡ Neovim Configuration

Personal Neovim setup built on top of [LazyVim](https://www.lazyvim.org/), customized for modular plugin management, rapid navigation, and terminal workflow integration.

---

## 🛠️ Requirements

Before installing, ensure you have the following installed on your system:

- **Neovim** $\ge$ 0.9.0 (compiled with LuaJIT)
- **Git** $\ge$ 2.19+
- A [Nerd Font](https://www.nerdfonts.com/) (e.g., JetBrainsMono Nerd Font) enabled in your terminal
- **ripgrep** & **fd** (for fuzzy searching via Telescope/FZF)
- C compiler and `make` (for Treesitter parsers)

---

## 🚀 Installation & Deployment

To deploy this exact configuration onto a new system, back up your existing Neovim folders and clone this repository into `~/.config/nvim`:

```bash
# 1. Back up existing configuration and state (if any)
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak

# 2. Clone repository into ~/.config/nvim
git clone [https://github.com/ManuelPrime-cpp-v/nvim-config.git](https://github.com/ManuelPrime-cpp-v/nvim-config.git) ~/.config/nvim

# 3. Launch Neovim (Lazy.nvim will automatically download and install all plugins)
nvim
# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
