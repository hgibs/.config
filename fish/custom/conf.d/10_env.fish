###########
# Exports #
###########

set -gx EDITOR hx
set -gx BYOBU_CONFIG_DIR ~/.config/byobu

set -gx LESSOPEN "| /System/Volumes/Data/opt/homebrew/bin/src-hilite-lesspipe.sh %s"
set -gx LESS ' -R '

set -gx PAGER 'less'

set -gx RANDOM_SOURCE 'urandom'

set -gx ASCIINEMA_CONFIG_HOME "$HOME/dotfiles/asciinema"