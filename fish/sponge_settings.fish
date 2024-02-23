# sponge configs https://github.com/meaningful-ooo/sponge
set sponge_allow_previously_successful false
set sponge_delay 5

# zoxide shouldn't be in the history, that's kind of the point
set sponge_regex_patterns (echo '^z\x20' | string unescape)
