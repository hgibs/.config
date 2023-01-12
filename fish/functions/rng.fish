if test $HOST_ENV_SETTING = home
	function rng
	  /opt/homebrew/bin/onlykey-cli rng hexbytes --count $argv[2] | env LC_CTYPE=C tr -dc $argv[1]
	  echo
	end
end