# set -gx FISH_MAJOR (fish --version | awk '{print $3}' | head -c 1)
set -gx FISH_MINOR (fish --version | awk '{print $3}' | head -c 3 | tail -c 1)

set fish_color_command brcyan
set fish_color_param green
set fish_color_quote normal
set fish_color_comment AAA
set fish_color_operator brmagenta
# set fish_color_error white
set fish_color_error brred

if set -q _identifier
    # do nothing
else
    if command -v ip >/dev/null 2>&1
        if test -z "$NIX_PATH"
            set -U _identifier (ip -j link show | jq -r '.[] | select(.ifname | test("en.*")) | .address')
        else
            set -U _identifier (ip -j link show | jq -r '.[] | select(.ifname | test("e.*")) | .address')-nixos
        end
    else if command -v ifconfig >/dev/null 2>&1
        if ifconfig -a | grep -q en0
            set -U _identifier (ifconfig en0 | grep ether | awk '{print $2}')
        else
            echo "Could not identify with ifconfig!"
        end
    else
        echo "ip and ifconfig both not present - cannot identify!"
    end
end

function remove_duplicates
    set -l oned_array (string join ' ' (printf (string join '\n' $argv) | uniq))
    string split ' ' "$oned_array"
end
