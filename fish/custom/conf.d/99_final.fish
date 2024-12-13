set -gx PATH (remove_duplicates $PATH)

if command -v zoxide >/dev/null 2>&1
    zoxide init fish | source
end
