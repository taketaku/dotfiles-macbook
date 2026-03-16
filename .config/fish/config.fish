set -x PATH $HOME/fvm/default/bin $PATH
set -x PATH $HOME/flutter/bin $PATH
set -Ux DOCKER_FILE_M2X_API Dockerfile.api.arm64
source $HOME/.local/bin/env.fish
set -gx PATH $PATH $HOME/Library/Android/sdk/platform-tools
set -Ux PATH $HOME/.local/bin $PATH

set -U FZF_LEGACY_KEYBINDINGS 0

tmux

# vi mode
fish_vi_key_bindings
bind p fish_clipboard_paste

# alias
alias fig='docker compose'
alias kc='kubectl'
alias mk='minikube'
alias tf='terraform'
alias ast='open -a /Applications/Android\ Studio.app'
alias cursor='open -a /Applications/Cursor.app'

string match -q "$TERM_PROGRAM" "vscode"
and . (code --locate-shell-integration-path fish)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/taketaku/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/taketaku/Downloads/google-cloud-sdk/path.fish.inc'; end

# Added by Antigravity
fish_add_path /Users/taketaku/.antigravity/antigravity/bin
