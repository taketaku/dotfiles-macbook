function tmux_session_select
    # fzf が無い場合はフォールバック
    if not type -q fzf
        tmux attach-session || tmux new-session -s (basename (pwd))
        return
    end

    while true
        set -l sessions (tmux list-sessions -F "#{session_name}" 2>/dev/null)

        if test (count $sessions) -eq 0
            # セッションが無い場合は名前を入力して新規作成
            read -P "New session name: " session_name
            if test -z "$session_name"
                set session_name (basename (pwd))
            end
            tmux new-session -s "$session_name"
            return
        end

        # 既存セッション + 新規作成オプションを fzf で選択
        set -l result (begin; for s in $sessions; echo $s; end; echo "[new session]"; end | \
            fzf --prompt="tmux session> " --height=40% --reverse --multi \
                --header="C-d: 削除  C-r: リネーム  Space: 複数選択" \
                --bind="space:toggle" \
                --expect=ctrl-d,ctrl-r)

        # fzf キャンセル時（Esc / ctrl-c）は何もしない
        if test (count $result) -eq 0
            return
        end

        set -l pressed_key $result[1]

        if test "$pressed_key" = ctrl-d
            # 削除フロー
            for target in $result[2..]
                # [new session] は削除対象外
                if test "$target" = "[new session]"
                    continue
                end
                read -P "Delete session '$target'? [y/N] " confirm
                if test "$confirm" = y
                    tmux kill-session -t "$target"
                end
            end
            # ループ先頭に戻り fzf を再表示
            continue
        else if test "$pressed_key" = ctrl-r
            # リネームフロー（単一選択のみ）
            set -l target $result[2]
            if test "$target" = "[new session]"
                continue
            end
            read -P "Rename session '$target' to: " new_name
            if test -n "$new_name"
                tmux rename-session -t "$target" "$new_name"
            end
            continue
        end

        # 通常フロー: Enter で選択
        # result[1] は空文字（expect したキー以外）、result[2] が選択項目
        set -l target $result[2]

        if test "$target" = "[new session]"
            read -P "New session name: " session_name
            if test -z "$session_name"
                set session_name (basename (pwd))
            end
            tmux new-session -s "$session_name"
        else
            tmux attach-session -t "$target"
        end
        break
    end
end
