function about
    # We tell argparse about -h/--help - this are short and long forms of the same option.
    # The "--" here is mandatory, it tells it from where to read the arguments.
    argparse --min-args=1 h/help -- $argv
    # exit if argparse failed because it found an option it didn't recognize - it will print an error
    or return

    # If -h or --help is given, we print a little help text and return
    if set -ql _flag_help
        echo "about [-h|--help] [COMMAND ...]\nDescribe path, related files, etc regarding ARGUMENT"
        return 0
    end

    for cmd in $argv
        echo $cmd
        echo -n "executable: "
        which $cmd
        echo -n "all files: "
        whereis $cmd | sed "s/$cmd: //"
        echo "function(s):"
        functions -D $cmd
        echo "abbr(s):"
        abbr -l | grep $cmd
        echo "other usage(s):"
        whatis $cmd
        echo “====================================================================”
    end
end