########
# PATH #
########

export PATH="/usr/local/sbin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"


###########
# Exports #
###########

export EDITOR=nano
export BYOBU_CONFIG_DIR="~/.config/byobu"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

##########
# Config #
##########

# zsh completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
fi




