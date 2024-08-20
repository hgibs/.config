function _latest_release_url --description 'gets latest release file from github, etc'
    argparse --name=latest_release_url h/help 'g/github_path=' -- $argv
    or return

    # If -h or --help is given, we print a little help text and return
    if set -ql _flag_help
        printf "Usage:\n_latest_release_url [-h|--help] -g|--github_path PATH\n" >&2
        return 0
    end

    if not set -ql _flag_github_path
        printf "-g or --github_path is required\n"
        printf "Usage:\n_latest_release_url [-h|--help] -g|--github_path PATH\n" >&2
        return 0
    end

    if command -vq jq
        set jq_installed 1
    else
        echo "jq must be installed" >&2
        return 1
    end

    set -g os_code unknown-unknown
    if string match -q 'gnu*' (uname -o | string lower)
        set -g os_code linux
    else if string match -q Darwin (uname -o)
        set -g os_code darwin
    end

    set -g proc_code (uname -m)
    # if test "$proc_code" = x86_64
    #     set -g proc_code amd64
    # end

    if set -ql _flag_github_path
        set -l github_url "https://api.github.com/repos/$_flag_github_path/releases/latest"

        set -l temp_urls_file (mktemp)
        curl -sL "$github_url" | jq -r '.assets[] | .name' >"$temp_urls_file"
        set -l temp_extensions (mktemp)
        grep -E 'gz$|\.zip$|\.tar$' <"$temp_urls_file" >"$temp_extensions"
        set -l prime_list_file (mktemp)
        cat "$temp_extensions" | grep "$os_code" >"$prime_list_file"

        set -l name ''
        if test (cat "$prime_list_file" | wc -l) -eq 1
            set name (cat "$prime_list_file")
        else
            cat "$temp_extensions" | grep "$os_code" | grep "$proc_code" >"$prime_list_file"
            if test (cat "$prime_list_file" | wc -l) -eq 1
                set name (cat "$prime_list_file")
            else
                set alt_proc_code amd64
                if test "$proc_code" = arm64
                    set alt_proc_code aarch64
                end
                cat "$temp_extensions" | grep "$os_code" | grep "$alt_proc_code" >"$prime_list_file"

                if test (cat "$prime_list_file" | wc -l) -eq 1
                    set name (cat "$prime_list_file")
                end

            end
        end

        if test -z "$name"
            printf "Couldn't find the right release out of these releases:\n"
            cat "$temp_urls_file"
            return 1
        end

        curl -sL "$github_url" | jq -r --arg n "$name" '.assets[] | select(.name==$n) | .browser_download_url'
        return 0
    end
end
