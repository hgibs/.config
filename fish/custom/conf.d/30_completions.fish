set kubectl_file "$HOME/.config/fish/completions/kubectl.fish"

if test (uname -o) != Darwin
    # brew vendor path actually works
    if command -v kubectl >/dev/null 2>&1
        if test ! -f "$kubectl_file"
            kubectl completion fish >"$kubectl_file"
        end
    end
end

if command -vq helmfile
    if not test -f "$HOME/.config/fish/completions/helmfile.fish"
        helmfile completion fish >"$HOME/.config/fish/completions/helmfile.fish"
    end
end

if command -vq fzf
    if not test -f "$HOME/.config/fish/completions/fzf.fish"
        fzf --fish >"$HOME/.config/fish/completions/fzf.fish"
    end
end
