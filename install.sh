#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

link() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "Linked: $dst -> $src"
}

# zsh
link "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# nvim — symlink individual config files, not the whole directory
# (plugin dirs like bundle/, lazy/ are installed separately at runtime)
mkdir -p "$HOME/.config/nvim"
link "$DOTFILES_DIR/nvim/init.lua"          "$HOME/.config/nvim/init.lua"
link "$DOTFILES_DIR/nvim/lua"               "$HOME/.config/nvim/lua"
link "$DOTFILES_DIR/nvim/coc-settings.json" "$HOME/.config/nvim/coc-settings.json"
link "$DOTFILES_DIR/nvim/lazy-lock.json"    "$HOME/.config/nvim/lazy-lock.json"
link "$DOTFILES_DIR/nvim/config"            "$HOME/.config/nvim/config"

echo "Done!"
