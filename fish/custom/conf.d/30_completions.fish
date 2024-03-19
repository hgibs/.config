set kubectl_file "$HOME/.config/fish/completions/kubectl.fish"

if test (uname -o) != "Darwin"
    # brew vendor path actually works
    if command -v kubectl >/dev/null 2>&1
        if test ! -f "$kubectl_file"
            kubectl completion fish > "$kubectl_file"
        end 
    end
end
