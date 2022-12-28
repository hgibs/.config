# Installation

#### Clone recursively
```
cd ~
mv .config .config.bak
git clone --recursive git@github.com:hgibs/.config.git
```

Copy files from .config.bak back in, as needed.

#### Link zsh configs
```
cd $HOME
ln -s .config/.zshrc .zshrc
```

#### Install packages

```
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

brew install 
```

(optional) [Rust!](https://www.rust-lang.org/tools/install) 

#### Manually import profile for iterm2

Profile is at [iterm2/DefaultNerdFont.json](iterm2/DefaultNerdFont.json)

