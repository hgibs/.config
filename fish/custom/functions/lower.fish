function lower
    while read line
        echo -n $line | tr '[:upper:]' '[:lower:]'
    end
end
