function tp --description "Create or switch tmux session"
    set -l session_name ""
    set -l directory ""

    if test (count $argv) -eq 0
        # 引数なし: カレントディレクトリ名をセッション名に
        set session_name (basename (pwd))
    else
        set session_name $argv[1]
        if test (count $argv) -ge 2
            set directory $argv[2]
        end
    end

    if tmux has-session -t "$session_name" 2>/dev/null
        # セッションが存在する場合
        if set -q TMUX
            tmux switch-client -t "$session_name"
        else
            tmux attach-session -t "$session_name"
        end
    else
        # セッションを新規作成
        if set -q TMUX
            if test -n "$directory"
                tmux new-session -d -s "$session_name" -c "$directory"
            else
                tmux new-session -d -s "$session_name"
            end
            tmux switch-client -t "$session_name"
        else
            if test -n "$directory"
                tmux new-session -s "$session_name" -c "$directory"
            else
                tmux new-session -s "$session_name"
            end
        end
    end
end
