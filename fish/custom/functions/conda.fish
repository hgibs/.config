#!/usr/bin/env fish

function conda
    if not set -q _CONDA_ROOT
        # init conda
        eval "$conda_bin" "shell.fish" hook | source
    end
    eval "$conda_bin" $argv
end
