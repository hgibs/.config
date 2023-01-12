###############################
# Overwrites of conf.d/*.fish #
###############################

if status is-interactive
    # Commands to run in interactive sessions only
    
    if test -z $HOST_ENV_SETTING
        echo "‼️ HOST_ENV_SETTING UNSET ‼️"
    end

    # should be at end
    starship init fish | source
end
