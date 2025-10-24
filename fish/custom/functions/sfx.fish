function sfx --argument-name sound
    if test "$sound" = sosumi
        set -f soundfile "$HOME/dotfiles/_assets/sosumi.mp3"
    else if test "$sound" = yay
        set -f soundfile "$HOME/dotfiles/_assets/yay-6326.ogg"
    else if test "$sound" = shortbeep
        set -f soundfile "$HOME/dotfiles/_assets/Bluezone_BC0303.ogg"
    else if test "$sound" = notification
        set -f soundfile "$HOME/dotfiles/_assets/notification-sound-269266-short.ogg"
    else if test "$sound" = trumpet-fail
        set -f soundfile "$HOME/dotfiles/_assets/cartoon-fail-trumpet-278822.ogg"
    else
        printf "unknown sfx sound '%s'\n" "$sound" >&2
        set -f soundfile "$HOME/dotfiles/_assets/sosumi.mp3"
    end

    # hyperfine lists ffplay as faster startup than afplay
    if command -vq ffplay
        ffplay -autoexit -loglevel quiet "$soundfile"
    else if command -vq mpv
        mpv --really-quiet --no-video "$soundfile"
    else if command -vq afplay
        afplay "$soundfile"
    end
end
