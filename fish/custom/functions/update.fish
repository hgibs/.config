function update --description 'Updates binary'
    argparse --name=update_binary -min-args 1 h/help 'u/url=' -- $argv
    or return

    if not set -q argv[1]
        printf (_ "%ls: Expected at least %d positional args, got only %d\n") update 1 0
        return 1
    end

    switch "$argv[1]"
        case helmfile
            if command -vq helmfile
                printf "helmfile version before:\n"
                helmfile --version
            end
            _update_binary --url (_latest_release_url -g helmfile/helmfile) helmfile
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
        xattr -dr com.apple.quarantine (which $argv[1])
    end
end
