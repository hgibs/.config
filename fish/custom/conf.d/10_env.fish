###########
# Exports #
###########

set -gx EDITOR hx
set -gx BYOBU_CONFIG_DIR ~/.config/byobu
set -gx LESSOPEN "| /System/Volumes/Data/opt/homebrew/bin/src-hilite-lesspipe.sh %s"
set -gx LESS ' -R '
set -gx PAGER less
set -gx RANDOM_SOURCE urandom
set -gx ASCIINEMA_CONFIG_HOME "$HOME/dotfiles/asciinema"
set -gx LANG "en_US.UTF-8"
set -gx ZELLIJ_CONFIG_DIR "$HOME/.config/zellij/linux_config"
if test (uname -o) = Darwin
    set -gx ZELLIJ_CONFIG_DIR "$HOME/.config/zellij/macos_config"
end
###############
# Non-exports #
###############
