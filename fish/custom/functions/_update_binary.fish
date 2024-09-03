function _update_binary --description 'Update a binary given a URL'
    argparse --name=update_binary -min-args 1 h/help 'u/url=' -- $argv
    or return

    set -f helptext "Usage:\n_update_binary [-h|--help] -u|--url URL binary\n"
    # If -h or --help is given, we print a little help text and return
    if set -ql _flag_help
        printf "$helptext" >&2
        return 0
    end

    if not set -ql _flag_url
        printf "You must set --url URL\n"
        printf "$helptext" >&2
        return 0
    end

    if not set -q argv[1]
        printf (_ "%ls: Expected at least %d positional args, got only %d\n") _update_binary 1 0
        printf "$argv[1] \n"
        printf "$helptext" >&2
        return 1
    end

    set -l binary_dest_dir "$HOME/bin"

    if command -vq $argv[1]
        set binary_dest_dir (dirname (command -v $argv[1]))
        if string match -q '*homebrew*' "$binary_dest_dir"
            printf "This binary seems to be managed by homebrew: '%s'\nexiting...\n" "$binary_dest_dir"
            return 1
        else if string match -q '/usr/bin*' "$binary_dest_dir"
            printf "This binary seems to be managed by apt: '%s'\nexiting...\n" "$binary_dest_dir"
            return 1
        end
    end

    if not test -d "$binary_dest_dir"
        printf "Please create %s\n" "$binary_dest_dir" >&2
        return 1
    end

    set -l binary_end_name $argv[1]
    set -l final_dest "$binary_dest_dir/$binary_end_name"
    printf "Downloading/extracting %s to %s\n" "$_flag_url" "$final_dest" >&2

    set -l tmpFile (mktemp)
    if string match '*.gz' "$_flag_url"
        printf "gunzip extracting file\n" >&2
        curl -sL "$_flag_url" | gunzip >"$tmpFile"
    else
        printf "extraction unecessary\n" >&2
        curl -sL "$_flag_url" >"$tmpFile"
    end

    set -l tmpDir (mktemp -d)
    if string match '*.tar*' "$_flag_url"
        printf "tar extracting result\n" >&2
        tar xf "$tmpFile" --directory "$tmpDir"
    else if string match '*.tgz' "$_flag_url"
        printf "tar extracting result\n" >&2
        tar xf "$tmpFile" --directory "$tmpDir"
    else
        cp "$tmpFile" "$final_dest"
        chmod +x "$final_dest"
        return
    end

    set -l extracted_bin (ls -1 | grep "$binary_end_name" | head -n 1)
    printf "extracted binary: %s" "$extracted_bin"
    cp "$tmpDir/$extracted_bin" "$final_dest"

    chmod +x "$final_dest"
end
