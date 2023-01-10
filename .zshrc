#!/usr/bin/env zsh

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Mandatory export
export ZSH="$HOME/.oh-my-zsh"

# Move config
ZSH_CUSTOM="$HOME/.config/oh-my-zsh-custom"

# oh-my-zsh configs
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="garyblessington"

ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "muse"  \
"wedisagree" "garyblessington" "edvardm" "sunrise" "mgutz")

# CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

# 'zsh-syntax-highlighting' must be last
plugins=(
  you-should-use
  rust
  git
  brew
  kubectl
  zsh-autosuggestions
  colored-man-pages
  command-not-found
  pip
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
eval "$(starship init zsh)"
