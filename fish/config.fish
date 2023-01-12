###############################
# Overwrites of conf.d/*.fish #
###############################

if status is-interactive
    # Commands to run in interactive sessions only
    
    if test -z $HOST_ENV_SETTING
        set_color --bold red; echo "‼️  HOST_ENV_SETTING UNSET ‼️"
    end

    set fish_greeting "Welcome to fish, the friendly interactive shell"

    # should be last executed line
    starship init fish | source
end
