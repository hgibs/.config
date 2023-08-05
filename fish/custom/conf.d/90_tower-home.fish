command -v ip >/dev/null 2>&1 || exit 0

ip link show | grep -q enp0s31f6
if test $status -ne 0
  exit 0
end 

# if test (ifconfig en0 | grep ether | awk '{print $2}') = "f8:4d:89:69:83:59" 
if test (ip -o link show enp0s31f6 | grep -oE "([a-f0-9]{2}:){5}[a-f0-9]{2}" | head -n 1) = "e0:d5:5e:21:8e:72"
	set -g HOST_ENV_SETTING tower-home

	set -gx STARSHIP_CONFIG ~/dotfiles/starship.toml

	# colorful less!
	set -gx LESSOPEN "| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

	# move asciinema config (which disables automatic uploading)
	set -gx ASCIINEMA_CONFIG_HOME "$HOME/dotfiles/asciinema"

	# add coursier to path
	fish_add_path -p "$HOME/.local/share/coursier/bin"

	# add pip to path
	fish_add_path -p "$HOME/.local/bin"
	
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	# eval /Users/hollandgibson/.miniforge3/bin/conda "shell.fish" "hook" $argv | source
	# <<< conda initialize <<<
end
