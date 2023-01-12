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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /Users/hollandgibson/miniforge3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

