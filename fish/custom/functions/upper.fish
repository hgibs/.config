function upper
    while read line
        echo -n $line | tr '[:lower:]' '[:upper:]'
    end
end
