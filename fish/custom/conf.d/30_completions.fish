set kubectl_file "$HOME/.config/fish/completions/kubectl.fish"
if test ! -f "$kubectl_file"
    kubectl completion fish > "$kubectl_file"
end 
