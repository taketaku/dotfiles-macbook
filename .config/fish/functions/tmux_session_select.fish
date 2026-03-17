function tmux_session_select
    set -l sessions (tmux list-sessions -F "#{session_name}" 2>/dev/null)

    if test (count $sessions) -eq 0
        # セッションが無い場合は名前を入力して新規作成
        read -P "New session name: " session_name
        if test -n "$session_name"
            tmux new-session -s "$session_name"
        else
            tmux new-session
        end
        return
    end

    # 既存セッション + 新規作成オプションを fzf で選択
    set -l selection (begin; for s in $sessions; echo $s; end; echo "[new session]"; end | fzf --prompt="tmux session> " --height=40% --reverse)

    if test -z "$selection"
        # fzf キャンセル時は何もしない
        return
    end

    if test "$selection" = "[new session]"
        read -P "New session name: " session_name
        if test -n "$session_name"
            tmux new-session -s "$session_name"
        else
            tmux new-session
        end
    else
        tmux attach-session -t "$selection"
    end
end
