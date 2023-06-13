function upper
    while read line
        echo $line | tr '[:lower:]' '[:upper:]'
    end
end
