# Installation

## Assumptions
`git` is already installed.

#### Clone recursively
```
cd ~
mv .config .config.bak
git clone --recursive git@github.com:hgibs/.config.git
```

Copy files from .config.bak back in, as needed.

#### Install packages

```
cat homebrewpackages.txt | grep '^[a-zA-Z]' | xargs brew install
```

Note: it is easier to keep things up to date with a `brew upgrade` rather than maintaining a bunch of `cargo` crates.

#### Configure fish
```
echo "$(which fish)" | sudo tee -a /etc/shells
chsh -s "$(which fish)"
```

#### Install Oh-my-fish and fisher
```
cdtemp
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install > install
fish install --path=$HOME/.local/share/omf --config=$HOME/.config/omf

curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install jhillyerd/plugin-git patrickf1/colored_man_pages.fish blackjid/plugin-kubectl paysonwallach/fish-you-should-use
```

(optional) [Rust!](https://www.rust-lang.org/tools/install) 

#### Manually import profile for iterm2

Profile is at [iterm2/DefaultNerdFont.json](iterm2/DefaultNerdFont.json)

