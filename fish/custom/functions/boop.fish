function boop
    command $argv
    set retcode $status

    if test $retcode -eq 0
        sfx notification
    else
        sfx sosumi
    end

    return $retcode
end
