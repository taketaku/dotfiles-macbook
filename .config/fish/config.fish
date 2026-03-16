set -gx PATH $HOME/fvm/default/bin $PATH
set -gx PATH $HOME/flutter/bin $PATH
set -gx DOCKER_FILE_M2X_API Dockerfile.api.arm64
source $HOME/.local/bin/env.fish
set -gx PATH $PATH $HOME/Library/Android/sdk/platform-tools
set -gx PATH $HOME/.local/bin $PATH

set -g FZF_LEGACY_KEYBINDINGS 0

if status is-interactive; and not set -q TMUX; and not string match -q "vscode" $TERM_PROGRAM
    tmux
end

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
