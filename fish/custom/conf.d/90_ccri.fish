command -v ip >/dev/null 2>&1 || exit 0

# if test (ifconfig en0 | grep ether | awk '{print $2}') = "f8:4d:89:69:83:59" 
if test (ip -o link show enp0s31f6 | grep -oE "([a-f0-9]{2}:){5}[a-f0-9]{2}" | head -n 1) = "ac:91:a1:14:29:d5"
	set -g HOST_ENV_SETTING ccri

	set -gx STARSHIP_CONFIG ~/dotfiles/starship.toml
	
	abbr -e ls # wait for exa to become available
	
	abbr mci 'mvn clean install'
	abbr mcis 'mvn clean install -DskipTests'
	abbr mdt 'mvn dependency:tree'
	abbr mst 'mvn -Dmaven.test.skip=true'
	abbr m 'mvn'
	abbr mt 'mvn test'
	abbr msc 'mvn scala:console'
	
	# colorful less!
	set -gx LESSOPEN "| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

	# move asciinema config (which disables automatic uploading)
	set -gx ASCIINEMA_CONFIG_HOME "$HOME/dotfiles/asciinema"

	set -gx MAVEN_OPTS '-Xmx1500M -Xms1G -Duser.timezone=UTC -Xss32m'
	set -gx JAVA_HOME "/usr/lib/jvm/java-8-openjdk-amd64"

	fish_add_path -a "$HOME/src/inrev"
	
	# add coursier to path
	fish_add_path -p "$HOME/.local/share/coursier/bin"

	# add pip to path
	fish_add_path -p "$HOME/.local/bin"
	
	# >>> conda initialize >>>
	# !! Contents within this block are managed by 'conda init' !!
	# eval /Users/hollandgibson/.miniforge3/bin/conda "shell.fish" "hook" $argv | source
	# <<< conda initialize <<<
end
