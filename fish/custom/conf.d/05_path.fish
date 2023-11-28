# fish_add_path -a 

fish_add_path -p "$HOME/.local/bin"

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

else if test (uname -o) = "GNU/Linux"
	fish_add_path -p $HOME/bin
end

# /opt/homebrew/opt/libpq/bin 
