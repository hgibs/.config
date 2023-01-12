###############################
# Overwrites of conf.d/*.fish #
###############################

# import my work
set -l custom_scripts $(command ls -1 $HOME/.config/fish/custom/conf.d/*.fish)
set -la custom_scripts $(command ls -1 $HOME/.config/fish/custom/functions/*.fish)

for s_file in $custom_scripts
    # echo $s_file
    source $s_file
end



if status is-interactive
    # Commands to run in interactive sessions only
    
    if test -z $HOST_ENV_SETTING
        set_color --bold red; echo "‼️  HOST_ENV_SETTING UNSET ‼️"
    end

    set fish_greeting "Welcome to fish, the friendly interactive shell"

    # should be last executed line
    starship init fish | source
end
