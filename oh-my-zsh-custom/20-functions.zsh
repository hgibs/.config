# FUNCTIONS
random(){
  cat /dev/urandom | env LC_CTYPE=C tr -dc $1 | head -c $2;
  echo;
}

upper() {
  echo "$1" | tr '[:lower:]' '[:upper:]'
}

shasum_recent(){
  cd ~/Downloads;
  shasum -a 256 $(ls -t | head -1);
}

rename_files () {
  if [[ $# < 3 ]]; then
    echo "Usage: rename_files [from basename] [to basename] basename.*"
    exit 1;
  fi
  echo "from $1.*"
  echo "to: $2.*"
  files=($@)
  for i in {3..$#}; do
    filename="$files[$i]"
    case $filename in
      (.*.*) extension=${filename##*.};;
      (.*)   extension="";;
      (*.*)  extension=${filename##*.};;
      (*)    extension="";;
    esac
    echo "${filename} > ${2}.${extension}"
    mv "${filename}" "${2}.${extension}"
  done
}

rust_debug(){
  project_name=$(pwd | awk -F '/' '{print $NF}')
  cargo build
  DBG_TARGET="$(ls -lt "target/debug/deps/${project_name}-*" | head -n 1 | awk '{print $NF}')"
  rust-lldb $DBG_TARGET
}

function br {
    local cmd cmd_file code
    cmd_file=$(mktemp)
    if broot --outcmd "$cmd_file" "$@"; then
        cmd=$(<"$cmd_file")
        command rm -f "$cmd_file"
        eval "$cmd"
    else
        code=$?
        command rm -f "$cmd_file"
        return "$code"
    fi
}
