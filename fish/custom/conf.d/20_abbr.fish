###########
# Aliases #
###########

## core utils replacements
abbr --add zshconfig "subl ~/.zshrc"
abbr --add sshconfig "subl ~/.ssh/config"
# abbr --add wanip 'dig @resolver4.opendns.com myip.opendns.com +short' - maybe use kdig?
abbr --add wanip 'curl -4 ifconfig.io/ip; curl -6 ifconfig.io/ip'
# abbr --add wanip 'dig @resolver4.opendns.com myip.opendns.com +short'
abbr --add tg terragrunt
abbr --add tf terraform
abbr --add tgaa "terragrunt apply --auto-approve"
abbr --add tgra "terragrunt run-all apply"
abbr --add weather "curl wttr.in/Charlottesville"

abbr --add reset_fish 'source ~/.config/fish/config.fish'

abbr --add t tldr
# abbr --add m '/usr/bin/man'
abbr --add p 'ping -o'

abbr --add md 'mkdir -p'
# abbr --add curl 'curl -#JLO'
abbr --add curlc 'curl -#LOC -'

# abbr --add godu '/opt/homebrew/opt/gdu/bin/gdu'
abbr --add godu '/opt/homebrew/Cellar/gdu/5.*/bin/gdu'

# abbr --add ohmyzsh "mate ~/.oh-my-zsh"
# abbr --add tf "terraform"

abbr --add tree2 'tree -L 2'
abbr --add tree3 'tree -L 3'

abbr --add l "eza -l --header --git --time-style=iso"
abbr --add ls "eza -la --header --git --time-style=long-iso"
abbr --add lsg "eza -lag --header --git --time-style=long-iso"
abbr --add buu "brew update && brew upgrade"

abbr --add ... "../.."
abbr --add .... "../../.."
abbr --add ..... "../../../.."
abbr --add ...... "../../../../.."

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

abbr --add !! --position anywhere --function last_history_item
abbr --add sauu "sudo apt update && sudo apt upgrade -y"

abbr -a L --position anywhere --set-cursor "% | less"

# Docker
# abbr --add psf "ps --format '{{.Names}}{{.Status}}' | column -t -s ' '"
abbr --add dps docker_ps_pretty
abbr --add dr "docker run --rm -it"
abbr --add watchdps "watch -dcx $FISH -c docker_ps_pretty"

## yt-dlp
abbr --add --position anywhere -- ytplaylist "-o \"%(playlist_index&{} - |)s%(title)s.%(ext)s\""

## Developer stuff
abbr --add watchf "watch -dcx $FISH -c"
abbr --add clippy_noboiler 'cargo clippy --fix -- -W clippy::pedantic -W clippy::nursery -W clippy::unwrap_used -W clippy::expect_used'
abbr --add vfn "vf new -p (latest_uv_python) (two_dirs \$PWD | tr / -)"
abbr --add vfa "vf activate (two_dirs \$PWD | tr / -)"

## Random Generators
abbr --add randhex "openssl rand -base64 16 | md5sum | head -c24; echo"
abbr --add randnum "$RANDOM_SOURCE '[:digit:]' 32"
abbr --add randomsym 'cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32; echo'
abbr --add randprint "$RANDOM_SOURCE '[:print:]' 64"
abbr --add randpwd "$RANDOM_SOURCE '[:graph:]' 64"
abbr --add randtext "$RANDOM_SOURCE '[:alnum:]' 64"

# abbr --add m '/usr/bin/man'
# abbr --add tf "terraform"
abbr --add sshconfig "subl ~/.ssh/config"

# git abbrs
abbr --add gcpc 'git cherry-pick --continue'
abbr --erase gcp
abbr --add gcp 'git cherry-pick -x'
abbr --add rm_orig 'find . -name \*.orig -delete'
abbr --add gfa 'git fetch --all --prune --tags'
abbr --add gstaa 'git stash --all'
abbr --add gbl 'git blame -b -w -C -C -C'
abbr --add gbu 'git branch -vv --set-upstream-to origin/(__git.current_branch) (__git.current_branch)'
abbr --add gp_ssl 'GIT_SSL_NO_VERIFY=1 git push'
abbr --add gt 'git tag'
abbr --add gtd "git for-each-ref --sort=creatordate --format '%(refname)' refs/tags | grep -Po '(?<=refs.tags.)\\S+'"
abbr --add gg 'br --conf ~/.config/broot/git-diff-conf.toml --git-status'

## additional git abbrs
# abbr --add gcm --set-cursor=% 'git commit -m "%"'
# abbr --add git https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# abbr --add git ssh="  git remote set-url origin git@github.com:$(    git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# abbr --add git https="git remote set-url origin 'https://lokilabs@dev.azure.com/lokilabs/Loki%20Datascience/_git/Loki_Datascience'"

# helm and k8s
abbr --add kga 'kubectl get all,cm,secret,ing,pvc,cert' #,certificaterequest'
abbr --add mk 'minikube kubectl --'
abbr --add hi 'helmfile --interactive'
abbr --add hia 'helmfile --interactive apply'
abbr --add ha 'helmfile apply'

# input
abbr --add maptrackball 'xinput set-button-map (xinput list --id-only "Kensington Slimblade Trackball") 3 2 1 4 5 6 7 8 9'
