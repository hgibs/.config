if test "$FISH_MAJOR" -lt 4
    exit 0
end

# if test $is_darwin
if test "$_identifier" = "f8:4d:89:69:83:59"
    set -g HOST_ENV_SETTING home

    set -gx HELIX_RUNTIME $HOME/Applications/helix/runtime
    set -gx GPG_TTY (tty)
    set -x SSH_AUTH_SOCK $HOME/Library/Containers/com.maxgoedjen.Secretive.SecretAgent/Data/socket.ssh
    # set -gx GNUPGHOME $HOME/.gnupg/onlykey  # use onlykey
    set -gx GNUPGHOME $HOME/.gnupg/macos # use secure (touchid)
    set -gx KUBECONFIG $HOME/.kube/config.yaml
    # set -gx ZELLIJ_CONFIG_DIR $HOME/.config/zellij/macos_config

    set -gx DICTIONARY en_US
    set -gx DICPATH "$HOME/.local/share/hunspell"

    fish_add_path -a /Users/hollandgibson/.miniforge3/bin
    fish_add_path -a "$HOME/.nimble/bin"
    fish_add_path -a "/Users/hollandgibson/Library/Application Support/Coursier/bin"
    fish_add_path -a "$HOME/.swiftly/bin"
    fish_add_path -a /usr/local/go/bin

    abbr parachute 'cd $HOME/Documents/cloud/parachute && bass source env.key'
    abbr vpsiac --position=command 'cd $HOME/Developer/cloud/vps-iac && bass source env.key'
    abbr keyb --position=anywhere '$HOME/Documents/projects/Mercury65Plus'
    abbr cf --position=command '$HOME/Documents/projects/cinefolders && bass source tmdb_apikey.secret'
    abbr knowb --position=anywhere '$HOME/Documents/hobby_projects/book_binding'
    # abbr ghost "/opt/homebrew/bin/gs"
    # abbr SSH="/usr/bin/ssh"
    # abbr ssh-shell='onlykey-agent ~/.ssh/github.pub -v --shell'
    # abbr s "onlykey-agent -c"
    abbr sshsign "ssh-keygen -Y sign -f ~/.ssh/secretive.touchid-home.pub -n file"

    abbr sshk "onlykey-agent -sk ECC5 -c"
    abbr sshs "onlykey-agent -sk ECC5 -s"
    # set these to use the onlykey
    abbr rngtext "rng '[:alnum:]' 64"
    abbr rnghex '/opt/homebrew/bin/onlykey-cli rng hexbytes --count 32'
    abbr rngnum "rng '[:digit:]' 32"

    # abbr mounttower 'sshfs holland@k8s-tower.home.hollandgibson.com:/home/holland $HOME/sshfs/tower'

    # Wasmer
    set -gx WASMER_DIR "/Users/hollandgibson/.wasmer"
    if test -z "$WASMER_CACHE_DIR"
        [ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
    end

    # pre-empt system ruby
    if test -d opt/homebrew/lib/ruby/gems
        set -l latest_gem (ls -1 /opt/homebrew/lib/ruby/gems | tail -n 1)
        fish_add_path -p "/opt/homebrew/Cellar/$latest_gem/bin"
    end
    if test -d /opt/homebrew/Cellar/ruby/
        set -l latest_ruby (ls -1 /opt/homebrew/Cellar/ruby/ | tail -n 1)
        fish_add_path -p "/opt/homebrew/Cellar/ruby/$latest_ruby/bin"
    end
    # swiftly
    source "/Users/hollandgibson/.swiftly/env.fish"

    # adds ~3ms to startup - but defaults to slightly better random source
    # utlimately not worth the hassle but keeping here for useful notes
    # if test (ioreg -p IOUSB -w0 -n ONLYKEY | grep CRYPTOTRUST -c) -gt 0;
    # 	set -gx RANDOM_SOURCE rng
    # end

    # This takes like 100ms and sucks to keep re-running.
    # There should be a way with universal variables to only run it once, like the docker
    # setup works.
    # >>> conda initialize >>>
    # !! Contents within this block are managed by 'conda init' !!
    # eval /Users/hollandgibson/.miniforge3/bin/conda "shell.fish" hook $argv | source
    # <<< conda initialize <<<
end
