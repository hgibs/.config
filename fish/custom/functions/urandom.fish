function urandom
  set -x LC_CTYPE C
  cat /dev/urandom | tr -cd $argv[1] | head -c $argv[2]
end
