###########
# Aliases #
###########


abbr --add zshconfig "subl ~/.zshrc"
abbr --add sshconfig "subl ~/.ssh/config"
abbr --add wanip 'dig @resolver4.opendns.com myip.opendns.com +short'
abbr --add tg terragrunt
abbr --add tf terraform
abbr --add tgaa "terragrunt apply --auto-approve"
abbr --add tgra "terragrunt run-all apply"

abbr --add weather "curl wttr.in/Charlottesville"

abbr --add clippy_noboiler 'cargo clippy --fix -- -W clippy::pedantic -W clippy::nursery -W clippy::unwrap_used -W clippy::expect_used'
abbr --add reset_fish 'source ~/.config/fish/config.fish && gpgconf --kill gpg-agent'

abbr --add t tldr
# abbr --add m '/usr/bin/man'
abbr --add p 'ping -o'

abbr --add md 'mkdir -p'
# abbr --add curl 'curl -#JLO'
abbr --add curlc 'curl -#LOC -'

abbr --add randtext "$RANDOM_SOURCE '[:alnum:]' 64"
abbr --add randprint "$RANDOM_SOURCE '[:print:]' 64"
abbr --add randpwd "$RANDOM_SOURCE '[:graph:]' 64"
abbr --add randnum "$RANDOM_SOURCE '[:digit:]' 32"
abbr --add randhex "openssl rand -base64 16 | md5sum | head -c24; echo"
abbr --add randomsym 'cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32; echo'

abbr --add gp_ssl 'GIT_SSL_NO_VERIFY=1 git push'
abbr --add gt 'git tag'
abbr --add gtd "git for-each-ref --sort=creatordate --format '%(refname)' refs/tags | grep -Po '(?<=refs.tags.)\\S+'"
abbr --add gg 'br --conf ~/.config/broot/git-diff-conf.toml --git-status'

# abbr --add godu '/opt/homebrew/opt/gdu/bin/gdu'
abbr --add godu '/opt/homebrew/Cellar/gdu/5.*/bin/gdu'

# abbr --add ohmyzsh "mate ~/.oh-my-zsh"
# abbr --add tf "terraform"

abbr --add tree2 'tree -L 2'
abbr --add tree3 'tree -L 3'

# abbr --add git https="git remote set-url origin 'https://lokilabs@dev.azure.com/lokilabs/Loki%20Datascience/_git/Loki_Datascience'"
# abbr --add git https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# abbr --add git ssh="  git remote set-url origin git@github.com:$(    git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"

abbr --add kga 'kubectl get all,cm,secret,ing,pvc,cert' #,certificaterequest'
abbr --add mk 'minikube kubectl --'
abbr --add hi 'helmfile --interactive'
abbr --add hia 'helmfile --interactive apply'
abbr --add ha 'helmfile apply'

# abbr --add psf "ps --format '{{.Names}}{{.Status}}' | column -t -s ' '"
abbr --add dr "docker run --rm -it"
abbr --add dps docker_ps_pretty
abbr --add dr "docker run --rm -it"
abbr --add watchf "watch -dcx $FISH -c"
abbr --add watchdps "watch -dcx $FISH -c docker_ps_pretty"

abbr --add l "eza -l --header --git --time-style=iso"
abbr --add ls "eza -la --header --git --time-style=long-iso"
abbr --add lsg "eza -lag --header --git --time-style=long-iso"

abbr --add buu "brew update && brew upgrade"


abbr --add ... "../.."
abbr --add .... "../../.."
abbr --add ..... "../../../.."

switch (uname -o)
    case '*Linux'
        # abbr --add open 'xdg-open' # fish includes this function
        abbr --add cb "| xsel -clipboard -input"
        abbr --add pb "xsel -clipboard -output |"
        abbr --add cl "xsel -clipboard -clear"
    case Darwin
        abbr --add cb "| pbcopy"
        abbr --add pb "pbpaste |"
end

# abbr --add !! --position anywhere --function last_history_item
abbr --add buu "brew update && brew upgrade"
abbr --add sauu "sudo apt update && sudo apt upgrade -y"

abbr --add tree2 'tree -L 2'
abbr --add tree3 'tree -L 3'
# abbr --add godu '/opt/homebrew/opt/gdu/bin/gdu'

abbr --add ls "eza -la --header --git --time-style=long-iso"
abbr --add lsg "eza -lag --header --git --time-style=long-iso"
abbr --add p 'ping -o'

# abbr --add psf "ps --format '{{.Names}}{{.Status}}' | column -t -s ' '"

abbr --add ... "../.."
abbr --add .... "../../.."
abbr --add ..... "../../../.."

abbr --add wanip 'dig @resolver4.opendns.com myip.opendns.com +short'
# abbr -a L --position anywhere --set-cursor "% | less"

## Developer stuff
abbr --add watchdps "watch -x $FISH -c docker_ps_pretty"
abbr --add watchf "watch -x $FISH -c"
abbr --add clippy_noboiler 'cargo clippy --fix -- -W clippy::pedantic -W clippy::nursery -W clippy::unwrap_used -W clippy::expect_used'
abbr --add vfn "vf new -p" (command -v python3.11) "(two_dirs \$PWD | tr / -)"
abbr --add vfa "vf activate (two_dirs \$PWD | tr / -)"


## additional git abbrs
# abbr --add gcm --set-cursor=% 'git commit -m "%"'
abbr --add gcpc 'git cherry-pick --continue'
abbr --erase gcp
abbr --add gcp 'git cherry-pick -x'
abbr --add rm_orig 'find . -name \*.orig -delete'
# abbr --add git https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# abbr --add git ssh="  git remote set-url origin git@github.com:$(    git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# abbr --add git https="git remote set-url origin 'https://lokilabs@dev.azure.com/lokilabs/Loki%20Datascience/_git/Loki_Datascience'"
abbr --add gp_ssl 'GIT_SSL_NO_VERIFY=1 git push'

## Random Generators
abbr --add randhex "openssl rand -base64 16 | md5 | head -c24; echo"
abbr --add randnum "$RANDOM_SOURCE '[:digit:]' 32"
abbr --add randomsym 'cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32; echo'
abbr --add randprint "$RANDOM_SOURCE '[:print:]' 64"
abbr --add randpwd "$RANDOM_SOURCE '[:graph:]' 64"
abbr --add randtext "$RANDOM_SOURCE '[:alnum:]' 64"


# abbr --add m '/usr/bin/man'
# abbr --add tf "terraform"
abbr --add dps docker_ps_pretty
abbr --add gg 'br --conf ~/.config/broot/git-diff-conf.toml --git-status'
abbr --add godu '/opt/homebrew/Cellar/gdu/5.*/bin/gdu'
abbr --add kga 'kubectl get all,cm,secret,ing,pvc,cert' #,certificaterequest'
abbr --add reset_fish 'source ~/.config/fish/config.fish && gpgconf --kill gpg-agent'
abbr --add sshconfig "subl ~/.ssh/config"
# terragrunt
abbr --add tf terraform
abbr --add tg terragrunt
abbr --add tgaa "terragrunt apply --auto-approve"
abbr --add tgra "terragrunt run-all apply"


## yt-dlp
# abbr --add --position anywhere -- ytplaylist "-o \"%(playlist_index&{} - |)s%(title)s.%(ext)s\""

# abbr --add git https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# abbr --add git ssh="  git remote set-url origin git@github.com:$(    git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# abbr --add git https="git remote set-url origin 'https://lokilabs@dev.azure.com/lokilabs/Loki%20Datascience/_git/Loki_Datascience'"

# abbr --add m '/usr/bin/man'
# abbr --add tf "terraform"

# git abbrs
abbr --add gfa 'git fetch --all --prune --tags'
abbr --add gstaa 'git stash --all'
abbr --add gbl 'git blame -b -w -C -C -C'
abbr --add gbu 'git branch -vv --set-upstream-to origin/(__git.current_branch) (__git.current_branch)'
