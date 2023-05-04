function update_rust_analyzer --description 'Updates rust-analyzer to latest release'
	set -l ra_path "$(which rust-analyzer)"
	echo -e "Version before:\n" (rust-analyzer --version) "\n"
	rm -f $ra_path
	curl -L --silent https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-aarch64-apple-darwin.gz | gunzip -c - > $ra_path
	chmod +x $ra_path
	echo -e "Version after:\n" (rust-analyzer --version)
end
