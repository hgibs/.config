# Loki Labs-specific settings
if [[ "$(ifconfig en0 | grep ether | awk '{print $2}')" == "f8:4d:89:69:83:59" ]];
then
	export PATH="$PATH:/Users/hollandgibson/Library/Python/3.10/bin"

	export ZSH_HOST_SETTING="home"
	export HELIX_RUNTIME="$HOME/Applications/helix/runtime"
	export ZSHCONFIG="$HOME/.config/oh-my-zsh-custom/99-home.zsh"

	alias parachute='cd $HOME/Documents/cloud/parachute && $EDITOR . && source env.key'
	alias vpsiac='cd $HOME/Documents/cloud/vps-iac && $EDITOR . && source env.key'
	alias keyb='cd $HOME/Documents/projects/Mercury65Plus && $EDITOR .'
	alias cinefolders='cd $HOME/Documents/projects/cinefolders && $EDITOR .'

	alias ghost="/opt/homebrew/bin/gs"

	# alias SSH="/usr/bin/ssh"
	# alias ssh-shell='onlykey-agent ~/.ssh/github.pub -v --shell'
	alias s="onlykey-agent -c"
	alias sshk="onlykey-agent -sk ECC5 -c"
	alias sshs="onlykey-agent -sk ECC5 -s"

	# set these to use the onlykey
	alias rngtext="rng '[:alnum:]' 64"
	alias rnghex='/opt/homebrew/bin/onlykey-cli rng hexbytes --count 32'
	alias rngnum="rng '[:digit:]' 32"

	# GPG agent
	export GPG_TTY=$(tty)

	#use onlykey
	export GNUPGHOME=$HOME/.gnupg/onlykey

	#kubectl setup
	export KUBECONFIG=$HOME/.kube/config.yaml

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	conda_path="$HOME/miniforge3/bin/conda"
	__conda_setup="$('$conda_path' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "$HOME/miniforge3/etc/profile.d/conda.sh" ]; then
	        . "$HOME/miniforge3/etc/profile.d/conda.sh"
	    else
	        export PATH="$HOME/miniforge3/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
fi