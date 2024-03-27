function rebuild_nixos 
    #adjusted from: https://gist.github.com/0atman/1a5133b842f929ba4c1e195ee67599d5
    $EDITOR ~/dotfiles/nixos/*
    cd "$HOME/dotfiles/nixos" || return 1

    # skip if no changes
    if git diff --quiet '*.nix'; then
        echo "No changes detected, exiting."
        return 0
    end

    nix fmt ./ >/dev/null || nix fmt ./ && echo "nix fmt failed!" && return 1
    
    # Shows your changes
    git diff -U0 '*.nix'

    echo "NixOS Rebuilding..."

    sudo nixos-rebuild switch &>nixos-switch.log || _rebuild_nixos_helper
    # Get current generation metadata
    set -l current (nixos-rebuild list-generations | grep current)

    # Commit all changes in the nixos dir only witih the generation metadata
    git add ./
    git commit -m "nixos-rebuild to: $current"
end

function _rebuild_nixos_helper
    cat "$HOME/dotfiles/nixos/nixos-switch.log" | grep --color error && return 1
end
