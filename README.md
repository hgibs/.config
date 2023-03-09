# Installation

## Assumptions
`git` is already installed.

#### Clone Recursively
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

#### Install fisher
```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

fisher update
```

#### Fix python
```
python -m pip install --user virtualfish
vf install
```

#### Optional
(optional) [Rust!](https://www.rust-lang.org/tools/install) 

Install/update [rust-analyzer](https://github.com/rust-lang/rust-analyzer):
```
mkdir -p ~/Applications/bin
rm -f ~/Applications/bin/rust-analyzer
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-aarch64-apple-darwin.gz | gunzip -c - > ~/Applications/bin/rust-analyzer
chmod +x ~/Applications/bin/rust-analyzer
```

#### Manually import profile for iterm2

Profile is at [iterm2/DefaultNerdFont.json](iterm2/DefaultNerdFont.json)

