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
# ~ 174ms before optimization:
set -l custom_scripts (command ls -1 $HOME/.config/fish/custom/conf.d/*.fish)

# ~ 7 ms:
set -la custom_scripts (command ls -1 $HOME/.config/fish/custom/functions/*.fish)

# ~ 12ms:
set -la custom_scripts (command ls -1 $HOME/.config/fish/custom/completions/*.fish)

# run `fish -c exit | sort --sort-numeric` with debug timings below to find slow scripts`
for s_file in $custom_scripts
    # set start_time (date +%s%N)

    source $s_file

    # set end_time (date +%s%N)
    # set iter_time (math "($end_time - $start_time) / 1000000")
    # printf "%s: %s\n" "$iter_time" "$s_file"
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
