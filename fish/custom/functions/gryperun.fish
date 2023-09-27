function gryperun
    command -v grype -q

    if test "$status" -ne 0
        set -l grypecache (mktemp -d --suffix 'gryperun_func')
        mkdir -p $grypecache
        chmod ugo+rwx $grypecache

        docker run --rm -i \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v $grypecache:/.cache/grype \
            anchore/grype:latest \
            $argv
    else
        grype $argv
    end
end