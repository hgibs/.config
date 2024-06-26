set kubectl_file "$HOME/.config/fish/completions/kubectl.fish"

if test (uname -o) != Darwin
    # brew vendor path actually works
    if test ! -f "$kubectl_file"
        kubectl completion fish >"$kubectl_file"
    end
end

if command -sq helmfile
    helmfile completion fish | source
end

if command -sq fzf
    fzf --fish | source
end

fzf --fish | source
