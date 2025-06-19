# fish_add_path -a 

fish_add_path -p "$HOME/.local/bin"
fish_add_path --prepend $HOME/bin

if test (uname -o) = Darwin
    # prepend homebrew and my tools first
    fish_add_path --prepend /usr/local/sbin
    fish_add_path --prepend /opt/homebrew/bin
    fish_add_path --prepend /opt/homebrew/sbin
    fish_add_path --prepend $HOME/Applications/bin

    # rest of paths
    fish_add_path --append '/Applications/Sublime Text.app/Contents/SharedSupport/bin'
    fish_add_path --append $HOME/.cargo/bin
    fish_add_path --append /opt/homebrew/opt/mysql-client/bin

else if test (uname -o) = GNU/Linux
    fish_add_path --append $HOME/.cargo/bin
    fish_add_path --append $HOME/node/bin
end
fish_add_path --append $HOME/go/bin

# could switch to `test -d` type checks

# mainly for fisher install
fish_add_path --append $HOME/.local/bin

# /opt/homebrew/opt/libpq/bin 
