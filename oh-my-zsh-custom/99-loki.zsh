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
fi