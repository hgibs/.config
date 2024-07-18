function websearch
    set -l search_terms (string split -n ' ' $argv | string join '+')
    open "https://kagi.com/search?q=$search_terms" 2>/dev/null
end
