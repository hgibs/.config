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


	push_artifactory () {
	  docker pull --platform linux/amd64 "$1"

	  NEW_TAG="artifactory.rtenclave.io/docker-public-local/$1"
	  docker tag $1 $NEW_TAG
	  docker push $NEW_TAG
	  STATUS=$?

	  echo "\n"

	  if [ "$STATUS" -eq 0 ]; then
	    K8S_IMG=$(docker inspect --format='{{index .RepoDigests 0}}' "$NEW_TAG")

	    echo "To use this image in a manifest, refer to its shasum, i.e.:"
	    echo "image: $K8S_IMG"
	  else
	    echo 'Push failed!! Please log in and try again.'
	    echo "docker login artifactory.rtenclave.io"
	  fi
	}

	alias loki='cd $HOME/Library/CloudStorage/OneDrive-LokiLabsInc/personal_docs/Loki-Catalisto/ && $EDITOR .'
	alias lokids='cd $HOME/CVS_Documents/Loki_Datascience && $EDITOR .'
	alias aco='cd $HOME/Library/CloudStorage/OneDrive-LokiLabsInc/personal_docs/ACO && $EDITOR .'

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