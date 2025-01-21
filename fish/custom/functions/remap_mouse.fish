if test "$HOST_ENV_SETTING" = ccri
    function remap_mouse
        if test -z "$argv"
            echo "Usage: remap_mouse [name] [mapings]" >&2
            return 2
        end
        set line (xinput list | grep "$argv[1]" | head -n 1 | grep -Eo 'id=[0-9]+')
        set mouse_id (echo "$line" | grep -Eo '[0-9]+')
        xinput set-button-map $mouse_id $argv[2]
        printf "xinput set-button-map $mouse_id $argv[2] \n"
    end
end
