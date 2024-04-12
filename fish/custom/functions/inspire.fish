function inspire -d "Choose an inspiring quote from random"
    set -q INSPIRE_QUOTE_JSON_FILE; or set INSPIRE_QUOTE_JSON_FILE "quotes.json"

    if command -vq "jq"
        jq --version >/dev/null
    else
        echo "'jq' command not found, please install it and add it to the \$PATH" >&2
        return 1
    end

    if test -f "$INSPIRE_QUOTE_JSON_FILE"
        set -l num_quotes (jq -r 'length' "$INSPIRE_QUOTE_JSON_FILE")
        set -l last_index (expr $num_quotes - 1)
        set -l index (shuf -i 0-$last_index -n 1)
        set -l quote (jq -r ".[$index].text" "$INSPIRE_QUOTE_JSON_FILE")
        set -l author (jq -r ".[$index].author" "$INSPIRE_QUOTE_JSON_FILE")
        printf "\"%s\"\n - %s\n" "$quote" "$author" 
    else
        echo "Could not find 'quotes.json' file. Please set the environment variable INSPIRE_QUOTE_JSON_FILE to the path to the desired quotes json file." >&2
        return 1
    end

end
