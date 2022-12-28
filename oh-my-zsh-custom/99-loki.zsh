# Loki Labs-specific settings
if [[ "$(ifconfig en0 | grep ether | awk '{print $2}')" == "f4:d4:88:68:cd:f8" ]];
then
	export ZSH_HOST_SETTING="loki"

	# set up yubikey
	export GPG_TTY=$(tty)
	unset SSH_AGENT_PID
	export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
	gpgconf --launch gpg-agent
	gpg-connect-agent updatestartuptty /bye > /dev/null

	alias loki='cd $HOME/Library/CloudStorage/OneDrive-LokiLabsInc/personal_docs/Loki-Catalisto/ && subl .'
	alias lokids='cd $HOME/CVS_Documents/Loki_Datascience && subl .'
	alias aco='cd $HOME/Library/CloudStorage/OneDrive-LokiLabsInc/personal_docs/ACO && subl .'

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	__conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
	if [ $? -eq 0 ]; then
	    eval "$__conda_setup"
	else
	    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
	        . "$HOME/miniconda3/etc/profile.d/conda.sh"
	    else
	        export PATH="$HOME/miniconda3/bin:$PATH"
	    fi
	fi
	unset __conda_setup
	# <<< conda initialize <<<
fi