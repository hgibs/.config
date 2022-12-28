# ALIASES
alias zshconfig="subl ~/.zshrc"
alias sshconfig="subl ~/.ssh/config"
alias wanip='dig @resolver4.opendns.com myip.opendns.com +short'
alias tg="terragrunt"
alias tgaa="terragrunt apply --auto-approve"
alias tgra="terragrunt run-all apply"
alias pip='noglob pip'
alias warp='cd /Users/lokiadmin/Documents/ACO/Projects/warpzone_priorities'
alias jq='noglob jq'

alias t='tldr'
alias m='/usr/bin/man'
alias p='ping -o'



alias randtext="random '[:alnum:]' 64"
alias randprint="random '[:print:]' 64"
alias randpwd="random '[:graph:]' 64"
alias randnum="random '[:digit:]' 32"
alias randhex="openssl rand -base64 16 | md5 | head -c24; echo"
alias randomsym='cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32; echo'

alias gp_ssl='GIT_SSL_NO_VERIFY=1 git push'

# alias godu='/opt/homebrew/opt/gdu/bin/gdu'
alias godu='/opt/homebrew/Cellar/gdu/5.*/bin/gdu'

# alias ohmyzsh="mate ~/.oh-my-zsh"
# alias tf="terraform"

alias gs='git status'
alias git-https="git remote set-url origin 'https://lokilabs@dev.azure.com/lokilabs/Loki%20Datascience/_git/Loki_Datascience'"
# alias git-https="git remote set-url origin https://github.com/$(git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
# alias git-ssh="  git remote set-url origin git@github.com:$(    git remote get-url origin | sed 's/https:\/\/github.com\///' | sed 's/git@github.com://')"
alias kga='kubectl get all,cm,secret,ing,pvc,cert' #,certificaterequest'