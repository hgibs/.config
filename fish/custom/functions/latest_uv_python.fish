function latest_uv_python
    set all_versions (uv python list --only-installed)
    echo $all_versions[1] | grep --color=never -Eo '/.*'
end
