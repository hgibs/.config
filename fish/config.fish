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
    if test "$s_file" != "/home/hgibson/.config/fish/custom/conf.d/90_macbook14-home.fish"
        source $s_file
    end
end

if status is-interactive
    # Commands to run in interactive sessions only
    
    if test -z $HOST_ENV_SETTING
        set_color --bold red; echo "‼️  HOST_ENV_SETTING UNSET ‼️"
    end

    set fish_greeting "Welcome to fish, the friendly interactive shell"

    # should be last executed line
    starship init fish | source

    # starship function can be later
    if test $FISH_MINOR -ge 4
        # transience supported in 3.4+
        enable_transience
    end
end

