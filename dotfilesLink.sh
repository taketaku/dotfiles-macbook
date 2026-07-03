#! /bin/bash

# home/ -> ~/
ln -fns ~/dotfiles/home/Brewfile ~/Brewfile
ln -fns ~/dotfiles/home/.gitconfig ~/.gitconfig
ln -fns ~/dotfiles/home/.gitignore_global ~/.gitignore_global
ln -fns ~/dotfiles/home/.tmux.conf ~/.tmux.conf
ln -fns ~/dotfiles/home/.ideavimrc ~/.ideavimrc
ln -fns ~/dotfiles/home/hammerspoon ~/.hammerspoon

# .config/ -> ~/.config/
ln -fns ~/dotfiles/.config/fish ~/.config/fish
ln -fns ~/dotfiles/.config/ghostty ~/.config/ghostty
ln -fns ~/dotfiles/.config/nvim ~/.config/nvim
ln -fns ~/dotfiles/.config/karabiner ~/.config/karabiner

# vscode
ln -fns ~/dotfiles/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -fns ~/dotfiles/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -fns ~/dotfiles/.config/vscode/tasks.json ~/Library/Application\ Support/Code/User/tasks.json

# fonts/ -> ~/Library/Fonts/ (macOS ignores symlinked fonts, so copy)
mkdir -p ~/Library/Fonts
for f in ~/dotfiles/fonts/*.ttf ~/dotfiles/fonts/*.otf; do
  [ -e "$f" ] || continue
  cp -f "$f" ~/Library/Fonts/
done
