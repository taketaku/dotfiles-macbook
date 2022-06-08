#! /bin/bash
ln -fns ~/dotfiles/Brewfile ~/Brewfile
ln -fns ~/dotfiles/.gitconfig ~/.gitconfig
ln -fns ~/dotfiles/.config/fish ~/.config/fish
ln -fns ~/dotfiles/.config/nvim ~/.config/nvim
ln -fns ~/dotfiles/.config/karabiner ~/.config/karabiner
ln -fns ~/dotfiles/.tmux.conf ~/.tmux.conf

# vscode
ln -fns ~/dotfiles/.config/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -fns ~/dotfiles/.config/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -fns ~/dotfiles/.config/vscode/tasks.json ~/Library/Application\ Support/Code/User/tasks.json