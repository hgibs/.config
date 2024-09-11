function update_helmfile --description 'Updates helmfile to latest release'
    if command -vq helmfile
        set -l helmfile_path (which helmfile)
        echo -e "Version before:\n" (helmfile --version) "\n"
    else
        echo "helmfile not present"
    end
    set -g proc_code (uname -m)
    if test "$proc_code" = x86_64
        set -g proc_code amd64
    end
    set -g os_code unknown-unknown
    if string match -q 'gnu*' (uname -o | string lower)
        set -g os_code linux
    else if string match -q Darwin (uname -o)
        set -g os_code darwin
    end

    set -l file_regex (echo "helmfile_.*_|$os_code|_|$proc_code|.tar.gz" \
        | string replace -a '|' '')
    set -l latest_url (curl -s https://api.github.com/repos/helmfile/helmfile/releases/latest \
		| jq -r ".assets[] | select(.name | test(\"$file_regex\")) | .browser_download_url")

    # echo $latest_url

    if test -n "$helmfile_path"
        rm -f $helmfile_path
    end
    curl -sL "$latest_url" | tar xz -C "$HOME/bin" helmfile

    if test $status -ne 0
        echo "Download failed!" >&2
        return 1
    end

    echo -e "Version after:\n" (helmfile --version)

    set --erase proc_code
    set --erase os_code
end
