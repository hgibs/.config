function lower
    while read line
        echo $line | tr '[:upper:]' '[:lower:]'
    end
end
