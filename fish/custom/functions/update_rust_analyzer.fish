function update_rust_analyzer --description 'Updates rust-analyzer to latest release'
	set -l ra_path (which rust-analyzer)
	echo -e "Version before:\n" (rust-analyzer --version) "\n"

	# download to temp location
	set -l tmp_path (mktemp)
	set -g proc_code (uname -m)
	if test "$proc_code" = "arm64"
		set -g proc_code "aarch64"
	end

	set -g os_code "unknown-unknown"
	if string match -q 'gnu*' (uname -o | string lower)
		set -g os_code "unknown-linux-gnu"
	else if string match -q 'Darwin' (uname -o)
		set -g os_code "apple-darwin"
	end
	
	set -l filename "rust-analyzer-$proc_code-$os_code.gz"
	curl -L --silent https://github.com/rust-lang/rust-analyzer/releases/latest/download/$filename | gunzip -c - > $tmp_path

	if test $status -ne 0
		echo "Download failed!" >&2
		return 1
	end
	
	rm -f $ra_path
	cp $tmp_path $ra_path
	chmod +x $ra_path
	echo -e "Version after:\n" (rust-analyzer --version)

	set --erase proc_code
	set --erase os_code
end
