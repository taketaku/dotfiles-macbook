fish_add_path $HOME/fvm/default/bin
fish_add_path $HOME/flutter/bin
set -gx DOCKER_FILE_M2X_API Dockerfile.api.arm64
source $HOME/.local/bin/env.fish
fish_add_path $HOME/Library/Android/sdk/platform-tools
fish_add_path $HOME/.local/bin

set -g FZF_LEGACY_KEYBINDINGS 0

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
if [ -f "$HOME/Downloads/google-cloud-sdk/path.fish.inc" ]; . "$HOME/Downloads/google-cloud-sdk/path.fish.inc"; end

# Added by Antigravity
fish_add_path $HOME/.antigravity/antigravity/bin
/opt/homebrew/bin/brew shellenv | source

# mise activation
/opt/homebrew/bin/mise activate fish | source
