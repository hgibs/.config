set -gx FISH_MAJOR (fish --version | awk '{print $3}' | head -c 1)
set -gx FISH_MINOR (fish --version | awk '{print $3}' | head -c 3 | tail -c 1)

if test $FISH_MINOR -lt 2
    ### Copied from upstream
    function fish_add_path --description "Add paths to the PATH"
        # This is meant to be the easy one-stop shop to adding stuff to $PATH.
        # By default it'll prepend the given paths to a universal $fish_user_paths, excluding the already-included ones.
        #
        # That means it can be executed once in an interactive session, or stuffed in config.fish,
        # and it will do The Right Thing.
        #
        # The options:
        # --prepend or --append to select whether to put the new paths first or last
        # --global or --universal to decide whether to use a universal or global fish_user_paths
        # --path to set $PATH instead
        # --move to move existing entries instead of ignoring them
        # --verbose to print the set-command used
        # --dry-run to print the set-command without running it
        # We do not allow setting $PATH universally.
        #
        # It defaults to keeping $fish_user_paths or creating a universal, prepending and ignoring existing entries.
        argparse -x g,U -x P,U -x a,p g/global U/universal P/path p/prepend a/append h/help m/move v/verbose n/dry-run -- $argv
        or return

        if set -q _flag_help
            __fish_print_help fish_add_path
            return 0
        end

        set -l scope $_flag_global $_flag_universal
        if not set -q scope[1]; and not set -q fish_user_paths
            set scope -U
        end

        set -l var fish_user_paths
        set -q _flag_path; and set var PATH
        set -l mode $_flag_prepend $_flag_append
        set -q mode[1]; or set mode -p

        # To keep the order of our arguments, go through and save the ones we want to keep.
        set -l newpaths
        set -l indexes
        for path in $argv
            # Realpath allows us to canonicalize the path, which is needed for deduplication.
            # We could add a non-canonical version of the given path if no duplicate exists, but tbh that's a recipe for disaster.

            # realpath complains if a parent directory does not exist, so we silence stderr.
            set -l p (builtin realpath -s -- $path 2>/dev/null)

            # Ignore non-existing paths
            test -d "$p"; or continue

            if set -l ind (contains -i -- $p $$var)
                # In move-mode, we remove it from its current position and add it back.
                if set -q _flag_move
                    set -a indexes $ind
                    set -a newpaths $p
                end
            else
                # Without move, we only add it if it's not in.
                set -a newpaths $p
            end
        end

        # Ensure the variable is only set once, by constructing a new variable before.
        # This is to stop any handlers or anything from firing more than once.
        set -l newvar $$var
        if set -q _flag_move; and set -q indexes[1]
            # We remove in one step, so the indexes don't move.
            set -e newvar["$indexes"]
        end
        set $mode newvar $newpaths

        # Finally, only set if there is anything *to* set.
        # This saves us from setting, especially in the common case of someone putting this in config.fish
        # to ensure a path is in $PATH.
        if set -q newpaths[1]; or set -q indexes[1]
            if set -q _flag_verbose; or set -q _flag_n
                # The escape helps make it unambiguous - so you see whether an argument includes a space or something.
                echo (string escape -- set $scope $var $newvar)
            end

            not set -q _flag_n
            and set $scope $var $newvar
            return 0
        else
            # echo $argv
            return 1
        end
    end
end

set fish_color_command brcyan
set fish_color_param green
set fish_color_quote normal
set fish_color_comment AAA
set fish_color_operator brmagenta
# set fish_color_error white
set fish_color_error brred

if set -q _identifier
    # do nothing
else
    if command -v ip >/dev/null 2>&1
        if test -z "$NIX_PATH"
            set -U _identifier (ip -j link show | jq -r '.[] | select(.ifname | test("en.*")) | .address')
        else
            set -U _identifier (ip -j link show | jq -r '.[] | select(.ifname | test("e.*")) | .address')-nixos
        end
    else if command -v ifconfig >/dev/null 2>&1
        if ifconfig -a | grep -q en0
            set -U _identifier (ifconfig en0 | grep ether | awk '{print $2}')
        else
            echo "Could not identify with ifconfig!"
        end
    else
        echo "ip and ifconfig both not present - cannot identify!"
    end
end

function remove_duplicates
    set -l oned_array (string join ' ' (printf (string join '\n' $argv) | uniq))
    string split ' ' "$oned_array"
end
