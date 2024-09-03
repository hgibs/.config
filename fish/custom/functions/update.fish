function update --description 'Updates binary'
    argparse --name=update_binary -min-args 1 h/help 'u/url=' -- $argv
    or return

    if not set -q argv[1]
        printf (_ "%ls: Expected at least %d positional args, got only %d\n") update 1 0
        return 1
    end

    switch "$argv[1]"
        case fzf
            if command -vq fzf
                printf "fzf version before:\n"
                fzf --version
            end
            _update_binary --url (_latest_release_url -g junegunn/fzf) fzf
            rm -rf "$HOME/.config/fish/completions/fzf.fish"
        case helmfile
            if command -vq helmfile
                printf "helmfile version before:\n"
                helmfile --version
            end
            _update_binary --url (_latest_release_url -g helmfile/helmfile) helmfile
            rm -rf "$HOME/.config/fish/completions/helmfile.fish"
        case rust-analyzer
            if command -vq rust-analyzer
                printf "rust-analyzer version before:\n"
                rust-analyzer --version
            end
            _update_binary --url (_latest_release_url -g rust-analyzer/rust-analyzer) rust-analyzer
        case '*'
            printf "Unknown binary: '$argv[1]'\n"
            return 1
    end

    if test (uname -o) = Darwin
        if xattr (which $argv[1]) | grep com.apple.quarantine
            xattr -dr com.apple.quarantine (which $argv[1])
            printf "Un-quarantined %s\n" (which $argv[1])
        else
            printf "No quarantine on %s\n" (which $argv[1])
        end
    end
end
