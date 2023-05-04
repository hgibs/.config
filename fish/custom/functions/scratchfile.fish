function scratchfile
    set -f tfile (mktemp)
    $EDITOR $tfile
    echo $tfile
end
