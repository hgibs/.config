###############################
# Overwrites of conf.d/*.fish #
###############################

# set $FISH for as many processes as possible
set -Ux FISH (command -v fish)

# load some plugins
# maybe these should only load in specific circumstances?, or run in background?

# cless
# test

# import my work
# conf.d sets the HOST_ENV_SETTING which must happen for some functions to get correctly defined
set -l custom_scripts (command ls -1 $HOME/.config/fish/custom/conf.d/*.fish)
set -la custom_scripts (command ls -1 $HOME/.config/fish/custom/functions/*.fish)
set -la custom_scripts (command ls -1 $HOME/.config/fish/custom/completions/*.fish)

for s_file in $custom_scripts
    # echo $s_file
    source $s_file
end

if status is-interactive
    # Commands to run in interactive sessions only

    if test -z $HOST_ENV_SETTING
        set_color --bold red
        echo "‼️  HOST_ENV_SETTING UNSET ‼️"
        set -g BYOBU_ENABLE true
    end

    set fish_greeting "Welcome to fish, the friendly interactive shell"

    # should be last executed line
    starship init fish | source

    # starship function can be later
    if test $FISH_MINOR -ge 4
        # transience supported in 3.4+
        enable_transience
    end

    # if test -z "$HOST_ENV_SETTING" -o "$BYOBU_ENABLE" = "true" 
    #     exec byobu-launcher
    # end
end

# status --is-login; and status --is-interactive; and test "$BYOBU_ENABLE" = "true"; and exec byobu-launcher

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/holland/miniforge3/bin/conda
    eval /home/holland/miniforge3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/holland/miniforge3/etc/fish/conf.d/conda.fish"
        . "/home/holland/miniforge3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/holland/miniforge3/bin" $PATH
    end
end
# <<< conda initialize <<<

