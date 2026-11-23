#!/usr/bin/env bash

# Exit immediately if a command fails
set -e

# Automatically detect the exact folder where this script lives
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="$HOME/.config/nvim"

echo "Setting up Neovim configuration from: $REPO_DIR"

# 1. Ensure the parent ~/.config directory exists (crucial for fresh Termux/Linux setups)
mkdir -p "$HOME/.config"

# 2. Prevent running if the repo is already cloned directly into ~/.config/nvim
if [ "$REPO_DIR" = "$TARGET_DIR" ]; then
    echo "Repository is already located at $TARGET_DIR. No linking needed!"
    exit 0
fi

# 3. Safely back up any existing Neovim configuration
if [ -e "$TARGET_DIR" ] || [ -L "$TARGET_DIR" ]; then
    BACKUP_DIR="${TARGET_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
    echo "Existing config found. Backing it up to $BACKUP_DIR..."
    mv "$TARGET_DIR" "$BACKUP_DIR"
fi

# 4. Create the symlink so future 'git pull' updates apply automatically
ln -s "$REPO_DIR" "$TARGET_DIR"
echo "Successfully linked $REPO_DIR -> $TARGET_DIR"
