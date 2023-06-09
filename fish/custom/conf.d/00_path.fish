# fish_add_path -a 

set -gx FISH_MAJOR (fish --version | awk '{print $3}' | head -c 1)
set -gx FISH_MINOR (fish --version | awk '{print $3}' | head -c 3 | tail -c 1)

# todo, add if dir exists instead of this set of checks

if test (uname -o) = "Darwin"
	# prepend homebrew and my tools first
	fish_add_path -p /usr/local/sbin
	fish_add_path -p /opt/homebrew/bin 
	fish_add_path -p /opt/homebrew/sbin
	fish_add_path -p $HOME/Applications/bin

	# rest of paths
	fish_add_path -a '/Applications/Sublime Text.app/Contents/SharedSupport/bin'
	fish_add_path -a $HOME/.cargo/bin
	fish_add_path -a /opt/homebrew/opt/mysql-client/bin

	# mainly for fisher install
	fish_add_path -a $HOME/.local/bin

else if test (uname -o) = "GNU/Linux"
	if test $FISH_MINOR -lt 2 
		set -U fish_user_paths $HOME/bin $fish_user_paths
	else
		fish_add_path -p $HOME/bin
	end
end

# /opt/homebrew/opt/libpq/bin 