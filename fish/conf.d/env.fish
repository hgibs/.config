###########
# Exports #
###########

set -gx EDITOR hx
set -gx BYOBU_CONFIG_DIR ~/.config/byobu

set -gx LESSOPEN "| /System/Volumes/Data/opt/homebrew/bin/src-hilite-lesspipe.sh %s"
set -gx LESS ' -R '

set -gx PAGER 'less'

if status is-interactive
    # Commands to run in interactive sessions can go here

    # should be at end:
    starship init fish | source
end
