# fish_add_path -a 

if test (uname -o) = "Darwin"
	# prepend homebrew and my tools first
	fish_add_path --prepend /usr/local/sbin
	fish_add_path --prepend /opt/homebrew/bin 
	fish_add_path --prepend /opt/homebrew/sbin
	fish_add_path --prepend $HOME/Applications/bin

	# rest of paths
	fish_add_path --append '/Applications/Sublime Text.app/Contents/SharedSupport/bin'
	fish_add_path --append $HOME/.cargo/bin
	fish_add_path --append /opt/homebrew/opt/mysql-client/bin

	# mainly for fisher install
	fish_add_path --append $HOME/.local/bin

else if test (uname -o) = "GNU/Linux"
	fish_add_path --prepend $HOME/bin
	fish_add_path --append $HOME/.cargo/bin
end

# /opt/homebrew/opt/libpq/bin 

