set -gx FISH_MAJOR (fish --version | awk '{print $3}' | head -c 1)
set -gx FISH_MINOR (fish --version | awk '{print $3}' | head -c 3 | tail -c 1)

set fish_color_command brcyan
set fish_color_param green
set fish_color_quote normal
set fish_color_comment AAA
set fish_color_operator brmagenta
# set fish_color_error white
set fish_color_error brred