# command -v ip >/dev/null 2>&1 || exit 0

# ip link show | grep -q enp9s0
# if test $status -ne 0
#     exit 0
# end

# # if test (ifconfig en0 | grep ether | awk '{print $2}') = "f8:4d:89:69:83:59"
# if test (ip -o link show enp9s0 | grep -oE "([a-f0-9]{2}:){5}[a-f0-9]{2}" | head -n 1) = "9c:6b:00:1d:ad:d4"
if test "$_identifier" = "9c:6b:00:1d:ad:d4"
    set -g HOST_ENV_SETTING gamingpc-home

    set -gx HELIX_RUNTIME $HOME/.config/helix/runtime
    set -gx STARSHIP_CONFIG ~/dotfiles/starship.toml

    # move asciinema config (which disables automatic uploading)
    set -gx ASCIINEMA_CONFIG_HOME "$HOME/dotfiles/asciinema"

    # set -gx KITTY_CONF_INCLUDE "include $HOME/.config/kitty/kitty-themes/themes/VibrantInk.conf"

    fish_add_path -p "$HOME/.local/bin"
    fish_add_path -a "$HOME/.cargo/bin"

    fish_add_path -a "$HOME/miniforge3/bin"
    # enable byobu
    # set -g BYOBU_ENABLE true
end
