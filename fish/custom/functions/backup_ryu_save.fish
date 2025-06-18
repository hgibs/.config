function backup_ryu_save
    if test -z "$argv"
        echo "Usage: backup_ryu_save [game] [source_machine]\n" >&2
        printf "\tSupported games: arceus, scarlet\n" >&2
        printf "\tCopies to/from: linuxgamingpc, steamdeck\n" >&2
        return 2
    end

    set -l sourcemachine "$argv[2]"
    if test "$sourcemachine" = linuxgamingpc
        printf "linuxgamingpc -> steamdeck\n"
        set -f srcuser holland
        set -f srchostname linuxgamingpc
        set -f srcprefix "/home/sunshine/.config/Ryujinx"
        set -f destuser deck
        set -f desthostname steamdeck
        set -f destprefix "/home/deck/.config/Ryujinx"
    else if test "$sourcemachine" = steamdeck
        printf "steamdeck -> linuxgamingpc\n"
        set -f srcuser deck
        set -f srchostname steamdeck
        set -f srcprefix "/home/deck/.config/Ryujinx"
        set -f destuser holland
        set -f desthostname linuxgamingpc
        set -f destprefix "/home/holland/.config/Ryujinx"
    else
        printf "Unknown source machine!\n" >&2
        exit 1
    end

    set -l gamename "$argv[1]"
    if test $gamename = arceus
        set -f savedir_location bis/user/save/0000000000000001/0
        # set -f lgpc_location "/home/holland/.config/Ryujinx/bis/user/save/0000000000000001/0"
    else if test $gamename = scarlet
        set -f savedir_location bis/user/save/0000000000000004/0
    else
        echo "Unsupported game: $gamename"
        return 1
    end

    set srcmtime "$(ssh -l "$srcuser" "$srchostname" stat -c '%Y' "$srcprefix/$savedir_location/main")"
    set destmtime "$(ssh -l "$destuser" "$desthostname" stat -c '%Y' "$destprefix/$savedir_location/main")"

    if test "$srcmtime" -le "$destmtime"
        printf "%s <= %s! Destination seems newer than source, aborting!\n" "$srcmtime" "$destmtime"
        exit 1
    else
        printf "%s > %s - OK to overwrite\n" "$srcmtime" "$destmtime"
    end

    # backup source
    set -f localtmpdir (mktemp -d --suffix '_backup_ryu_save_src')
    scp -rp "$srcuser@$srchostname:$srcprefix/$savedir_location" "$localtmpdir"
    cd "$localtmpdir" || exit 1
    set -l filename "$gamename-$(date -d "@$srcmtime" --iso-8601=minutes | tr : _)-$sourcemachine.tar.gz"
    tar czf "$filename" *
    mkdir -p "$HOME/Documents/gaming/switch/save_backups/"
    cp "$filename" "$HOME/Documents/gaming/switch/save_backups/"

    # backup dest
    set -f localtmpdir2 (mktemp -d --suffix '_backup_ryu_save_dst')
    scp -rp "$destuser@$desthostname:$destprefix/$savedir_location" "$localtmpdir2"
    cd "$localtmpdir2" || exit 1
    set -l filename2 "$gamename-$(date -d "@$destmtime" --iso-8601=minutes | tr : _)-$destmachine.tar.gz"
    tar czf "$filename2" *
    cp "$filename2" "$HOME/Documents/gaming/switch/save_backups/"

    # overwrite dest
    ssh -l "$destuser" "$desthostname" "rm -r $destprefix/$savedir_location"
    scp -rp "$srcuser@$srchostname:$srcprefix/$savedir_location" "$destuser@$desthostname:$destprefix/$savedir_location"
    rm -rf "$localtmpdir"
    rm -rf "$localtmpdir2"
end
