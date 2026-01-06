# set -gx PATH (remove_duplicates $PATH)

set -gx SHELL (command -v fish)

if command -v rbenv >/dev/null 2>&1
    status --is-interactive; and rbenv init - --no-rehash fish | source
end

if command -v zoxide >/dev/null 2>&1
    zoxide init fish | source
end
