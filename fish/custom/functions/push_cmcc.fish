if test "$HOST_ENV_SETTING" = ccri
    function push_cmcc
        argparse --name push_cmcc 'i/image=' 't/tag=' -- $argv
        or return

        set -l imagetag (string split --max 1 --no-empty --right '/' $_flag_image | tail -n 1)
        set -l imageonly (string split --max 1 --no-empty ':' $imagetag | head -n 1)
        set -l target "docker-art.ccri.com/hgibson/$imageonly:$_flag_tag"
        echo "$_flag_image -> $target"

        docker tag "$_flag_image" "$target"
        docker push "$target"
    end
end