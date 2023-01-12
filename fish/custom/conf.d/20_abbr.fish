###########
# Aliases #
###########


abbr zshconfig "subl ~/.zshrc"
abbr sshconfig "subl ~/.ssh/config"
abbr wanip 'dig @resolver4.opendns.com myip.opendns.com +short'
abbr tg "terragrunt"
abbr tgaa "terragrunt apply --auto-approve"
abbr tgra "terragrunt run-all apply"
abbr warp 'cd /Users/lokiadmin/Documents/ACO/Projects/warpzone_priorities'
abbr jq 'noglob jq'

abbr t 'tldr'
# abbr m '/usr/bin/man'
abbr p 'ping -o'

abbr md 'mkdir -p'

abbr randtext "random '[:alnum:]' 64"
abbr randprint "random '[:print:]' 64"
abbr randpwd "random '[:graph:]' 64"
abbr randnum "random '[:digit:]' 32"
abbr randhex "openssl rand -base64 16 | md5 | head -c24; echo"
abbr randomsym 'cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32; echo'

abbr gp_ssl 'GIT_SSL_NO_VERIFY=1 git push'

# abbr godu '/opt/homebrew/opt/gdu/bin/gdu'
abbr godu '/opt/homebrew/Cellar/gdu/5.*/bin/gdu'

# abbr ohmyzsh "mate ~/.oh-my-zsh"
# abbr tf "terraform"

abbr tree2 'tree -L 2'
abbr tree3 'tree -L 3'

# abbr git https="git remote set-url origin 'https://lokilabs@dev.azure.com/lokilabs/Loki%20Datascience/_git/Loki_Datascience'"
# abbr git https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# abbr git ssh="  git remote set-url origin git@github.com:$(    git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
abbr kga 'kubectl get all,cm,secret,ing,pvc,cert' #,certificaterequest'


abbr ls "exa -lag --header"