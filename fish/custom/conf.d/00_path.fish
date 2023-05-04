# fish_add_path -a 

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
	if test (fish --version | grep -o "[0-9].[0-9]") = "3.1"
		set -U fish_user_paths $HOME/bin $fish_user_paths
	else
		fish_add_path -p $HOME/bin
	end
end

# /opt/homebrew/opt/libpq/bin 