###############################
# Overwrites of conf.d/*.fish #
###############################

# load some plugins
# maybe these should only load in specific circumstances?, or run in background?

# cless

# import my work
# load functions first so they can be used by abbrs
set -l custom_scripts $(command ls -1 $HOME/.config/fish/custom/functions/*.fish)
set -la custom_scripts $(command ls -1 $HOME/.config/fish/custom/conf.d/*.fish)
set -la custom_scripts $(command ls -1 $HOME/.config/fish/custom/completions/*.fish)

for s_file in $custom_scripts
    # echo $s_file
    source $s_file
end

# run custom plugin
# __kubectl_custom_init
# emit kubectl_install

if status is-interactive
    # Commands to run in interactive sessions only
    
    if test -z $HOST_ENV_SETTING
        set_color --bold red; echo "‼️  HOST_ENV_SETTING UNSET ‼️"
    end

    set fish_greeting "Welcome to fish, the friendly interactive shell"

    # should be last executed line
    starship init fish | source

    # starship function can be later
    enable_transience
end
