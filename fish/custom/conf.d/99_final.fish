# set -gx PATH (remove_duplicates $PATH)

set -gx SHELL (command -v fish)

if command -v zoxide >/dev/null 2>&1
    zoxide init fish | source
end
