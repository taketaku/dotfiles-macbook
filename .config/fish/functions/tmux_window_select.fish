function tmux_window_select
    if not type -q fzf
        return
    end

    while true
        set -l windows (tmux list-windows -F "#{window_index}:#{window_name}" 2>/dev/null)

        if test (count $windows) -eq 0
            return
        end

        set -l header "───────────────────────
  Enter: 切り替え
  C-r:   リネーム
  C-d:   削除
  <:     左へ移動
  >:     右へ移動
  Esc:   キャンセル
───────────────────────"

        set -l result (for w in $windows; echo $w; end | \
            fzf --prompt="tmux window> " --height=40% --reverse --no-multi \
                --header="$header" \
                --expect=ctrl-r,ctrl-d,\<,\>)

        # fzf キャンセル時（Esc / ctrl-c）
        if test (count $result) -eq 0
            return
        end

        set -l pressed_key $result[1]
        set -l target $result[2]

        if test -z "$target"
            return
        end

        set -l idx (string split ":" $target)[1]

        if test "$pressed_key" = ctrl-r
            # リネーム
            read -P "Rename window '$target' to: " new_name
            if test -n "$new_name"
                tmux rename-window -t $idx "$new_name"
            end
            continue
        else if test "$pressed_key" = ctrl-d
            # 削除（最後の1つは削除不可）
            if test (count $windows) -le 1
                continue
            end
            read -P "Delete window '$target'? [y/N] " confirm
            if test "$confirm" = y
                tmux kill-window -t $idx
            end
            continue
        else if test "$pressed_key" = "<"
            # 左へ移動
            set -l first_idx (string split ":" $windows[1])[1]
            if test "$idx" = "$first_idx"
                continue
            end
            set -l prev_idx (math $idx - 1)
            tmux swap-window -s $idx -t $prev_idx
            continue
        else if test "$pressed_key" = ">"
            # 右へ移動
            set -l last_idx (string split ":" $windows[-1])[1]
            if test "$idx" = "$last_idx"
                continue
            end
            set -l next_idx (math $idx + 1)
            tmux swap-window -s $idx -t $next_idx
            continue
        end

        # Enter: 切り替え
        tmux select-window -t $idx
        break
    end
end
