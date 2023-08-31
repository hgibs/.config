function remove_path
    argparse --name replace_path 'p/path=' -- $argv
    or return

    set -l frompath (string trim $_flag_path)
    
    if test -z "$frompath"
        echo "Usage: replace_path -p [path to remove]" >&2
        return 2
    end

    set -l idx (contains -i -- $frompath $PATH)
    # echo $idx
    
    if set -q idx[1]
        set --erase PATH[$idx]
    else
        return 1
    end
end