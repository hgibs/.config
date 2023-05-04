function rust_debug
	set -l project_name (pwd | awk -F '/' '{print $NF}')
	cargo build
	set -l debug_target (ls -lt "target/debug/deps/$project_name-*" | head -n 1 | awk '{print $NF}')
	rust-lldb $debug_target
end
