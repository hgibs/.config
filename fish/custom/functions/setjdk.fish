if test "$HOST_ENV_SETTING" = ccri
    function setjdk
        if test -z "$argv"
            echo "Usage: setjdk [version]" >&2
            return 2
        end

        set -l javaversion "$argv[1]"
        if test $javaversion -eq 20
            set -gx JAVA_HOME "$HOME/jvm/jdk-20.0.2"
        else if test $javaversion -eq 18
            set -gx JAVA_HOME "$HOME/jvm/jdk-18.0.2"
        else if test $javaversion -eq 17
            set -gx JAVA_HOME "$HOME/jvm/jdk-17.0.2"
        else if test $javaversion -eq 11
            set -gx JAVA_HOME "$HOME/jvm/jdk-11.0.2"
        else if test $javaversion -eq 8
            set -gx JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"
        else
            echo "Unsupported JDK: $javaversion"
            return 1
        end

        set -l oldjvm ""
        for p in $PATH
            if string match -q '*jvm*' $p
                # echo $p
                remove_path -p "$p"
            end
        end

        # fish_add_path -p "$JAVA_HOME/bin"
        set -p PATH "$JAVA_HOME/bin"

        java -version
    end
end