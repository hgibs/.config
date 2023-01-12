if test (ifconfig en0 | grep ether | awk '{print $2}') = "f4:d4:88:68:cd:f8"
	set -g HOST_ENV_SETTING loki

	set -gx HELIX_RUNTIME "$HOME/Documents/helix/runtime"
	set -gx JAVA_HOME "/Library/Java/JavaVirtualMachines/jdk-19.jdk/Contents/Home"

	# set up yubikey
	set -gx GPG_TTY $(tty)
	set -e -Ug SSH_AGENT_PID
	set -gx SSH_AUTH_SOCK $(gpgconf --list-dirs agent-ssh-socket)
	gpgconf --launch gpg-agent
	gpg-connect-agent updatestartuptty /bye > /dev/null

	abbr loki 'cd $HOME/Library/CloudStorage/OneDrive-LokiLabsInc/personal_docs/Loki-Catalisto/ && $EDITOR .'
	abbr lokids 'cd $HOME/CVS_Documents/Loki_Datascience && $EDITOR .'
	abbr aco 'cd $HOME/Library/CloudStorage/OneDrive-LokiLabsInc/personal_docs/ACO && $EDITOR .'

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	eval /Users/hollandgibson/miniconda3/bin/conda "shell.fish" "hook" $argv | source
	# <<< conda initialize <<<
end