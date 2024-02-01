function two_dirs -a dir
    set lastdir (basename $dir)
    set second (basename (string replace "/$lastdir" "" $dir))
    echo $second/$lastdir
end
