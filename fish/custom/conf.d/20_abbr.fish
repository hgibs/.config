###########
# Aliases #
###########


abbr --add zshconfig "subl ~/.zshrc"
abbr --add sshconfig "subl ~/.ssh/config"
abbr --add wanip 'dig @resolver4.opendns.com myip.opendns.com +short'
abbr --add tg "terragrunt"
abbr --add tgaa "terragrunt apply --auto-approve"
abbr --add tgra "terragrunt run-all apply"
abbr --add warp 'cd /Users/lokiadmin/Documents/ACO/Projects/warpzone_priorities'

abbr --add reset_fish 'source ~/.config/fish/config.fish'

abbr --add t 'tldr'
# abbr --add m '/usr/bin/man'
abbr --add p 'ping -o'

abbr --add md 'mkdir -p'

abbr --add randtext "random '[:alnum:]' 64"
abbr --add randprint "random '[:print:]' 64"
abbr --add randpwd "random '[:graph:]' 64"
abbr --add randnum "random '[:digit:]' 32"
abbr --add randhex "openssl rand -base64 16 | md5 | head -c24; echo"
abbr --add randomsym 'cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32; echo'

abbr --add gp_ssl 'GIT_SSL_NO_VERIFY=1 git push'

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

abbr --add l "exa -l"
abbr --add ls "exa -lag --header"

abbr --add buu "brew update && brew upgrade"

abbr --add vfn "vf new -p $(which python3.11) \$(basename \$PWD)"
abbr --add vfa "vf activate \$(basename \$PWD)"

abbr --add ... "../.."
abbr --add .... "../../.."
abbr --add ..... "../../../.."

switch (uname -o)
case 'Linux*'
    abbr --add open 'xdg-open'
end

abbr --add !! --position anywhere --function last_history_item