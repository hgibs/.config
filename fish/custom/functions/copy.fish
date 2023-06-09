function copy
    if test (uname -o) = "Darwin"
        pbcopy $argv
        exit $status
    else if test (uname -o) = "GNU/Linux"
        command -q xclip
        set -l xclip_status $status
        if test $xclip_status -eq 0
            xclip $argv
            exit $status
        end

        command -q wl-copy
        set -l wlcopy_status $status
        if test $wlcopy_status -eq 0
            wl-copy $argv
            exit $status
        end
    end

    echo "unknown copy mapping" 1>&2
    exit 1
end