function docker_ps_pretty
    set -l separator \u2060
    set -l col_header Name{$separator}Status
    set -l info (docker ps --format "{{.Names}}$separator{{.Status}}" | string collect)
    printf $col_header\n$info | column -t -s $separator
end
