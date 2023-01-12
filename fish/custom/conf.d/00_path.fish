fish_add_path -a 

# prepend homebrew and my tools first
fish_add_path -p /usr/local/sbin
fish_add_path -p /opt/homebrew/bin 
fish_add_path -p /opt/homebrew/sbin
fish_add_path -p $HOME/Applications/bin

# rest of paths
fish_add_path -a /Applications/Sublime Text.app/Contents/SharedSupport/bin
fish_add_path -a $HOME/.cargo/bin
fish_add_path -a /opt/homebrew/opt/mysql-client/bin

# /opt/homebrew/opt/libpq/bin 