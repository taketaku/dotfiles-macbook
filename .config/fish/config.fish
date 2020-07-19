set -x PATH $HOME/.anyenv/bin $PATH

set -U FZF_LEGACY_KEYBINDINGS 0

anyenv init - fish | source

# vi mode
fish_vi_key_bindings
bind p fish_clipboard_paste

# alias
alias fig='docker-compose'
alias kc='kubectl'
alias mk='minikube'
alias tf='terraform'