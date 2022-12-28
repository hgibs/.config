# Installation Notes

Install extra LSPs:
```
npm i -g bash-language-server vscode-langservers-extracted yaml-language-server

```

Download latest [ltex-ls](https://github.com/valentjn/ltex-ls/releases/) and copy somewhere to path

Add rust-analyzer if not already installed:
```
rustup component add rust-analyzer
ra_binpath=$(rustup which --toolchain stable rust-analyzer)
ln -s "$ra_binpath" "$HOME/Applications/bin/rust-analyzer"
```

Add TOML LSP:
```
cargo install taplo-cli --locked --features lsp
```

Double check the LSP health
```
hx --health
```