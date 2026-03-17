# Completions for tp (tmux session create/switch)

# 第1引数: 既存 tmux セッション名
complete -c tp -f -n "test (count (commandline -opc)) -eq 1" \
    -a "(tmux list-sessions -F '#{session_name}' 2>/dev/null)"

# 第2引数: ディレクトリパス
complete -c tp -n "test (count (commandline -opc)) -eq 2" -F
