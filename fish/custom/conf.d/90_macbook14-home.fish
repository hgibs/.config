if test (ifconfig en0 | grep ether | awk '{print $2}') = "f8:4d:89:69:83:59"
	set -g HOST_ENV_SETTING home

	fish_add_path -a /Users/hollandgibson/Library/Python/3.10/bin

	set -gx HELIX_RUNTIME $HOME/Applications/helix/runtime
	set -gx GPG_TTY $(tty)
	set -gx GNUPGHOME $HOME/.gnupg/onlykey  # use onlykey
	set -gx KUBECONFIG $HOME/.kube/config.yaml

	abbr parachute 'cd $HOME/Documents/cloud/parachute && $EDITOR . && source env.key'
	abbr vpsiac 'cd $HOME/Documents/cloud/vps-iac && $EDITOR . && source env.key'
	abbr keyb 'cd $HOME/Documents/projects/Mercury65Plus && $EDITOR .'
	abbr cinefolders 'cd $HOME/Documents/projects/cinefolders && $EDITOR .'
	# abbr ghost "/opt/homebrew/bin/gs"
	# abbr SSH="/usr/bin/ssh"
	# abbr ssh-shell='onlykey-agent ~/.ssh/github.pub -v --shell'
	abbr s "onlykey-agent -c"
	abbr sshk "onlykey-agent -sk ECC5 -c"
	abbr sshs "onlykey-agent -sk ECC5 -s"
	# set these to use the onlykey
	abbr rngtext "rng '[:alnum:]' 64"
	abbr rnghex '/opt/homebrew/bin/onlykey-cli rng hexbytes --count 32'
	abbr rngnum "rng '[:digit:]' 32"

	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	eval /Users/hollandgibson/miniforge3/bin/conda "shell.fish" "hook" $argv | source
	# <<< conda initialize <<<
end