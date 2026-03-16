# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

macOS dotfiles repository for user `taketaku`. Manages configuration for fish shell, neovim, tmux, VSCode, Karabiner-Elements, Ghostty terminal, and Homebrew packages.

## Setup

```bash
# Symlink all dotfiles to their expected locations
bash dotfilesLink.sh

# Install/sync Homebrew packages
brew bundle

# Clean up packages not in Brewfile
brew bundle cleanup
```

## Architecture

- `dotfilesLink.sh` — Creates symlinks from this repo to `~/.config/`, `~/`, and `~/Library/Application Support/Code/User/` (for VSCode)
- `Brewfile` — Homebrew package manifest (formulae + casks)
- `.config/fish/` — Fish shell config; uses vi key bindings, auto-launches tmux
- `.config/nvim/init.vim` — Neovim configuration
- `.config/karabiner/` — Karabiner-Elements key remapping
- `.config/ghostty/config` — Ghostty terminal emulator config
- `.config/vscode/` — VSCode settings, keybindings, tasks, and extension management
- `.tmux.conf` — tmux configuration
- `.gitconfig` — Git config with aliases (`co`, `fe`, `st`, `ci`, `br`) and AWS secrets detection patterns
- `.ideavimrc` — IdeaVim (Android Studio) config

## Key Details

- Fish shell uses vi mode (`fish_vi_key_bindings`) with clipboard paste bound to `p`
- Git push default is `current` (pushes to same-named remote branch)
- Git has AWS secret detection patterns configured via `git-secrets`
- Version management uses `mise` (formerly rtx/asdf)
- Flutter is managed via `fvm` (Flutter Version Management)
