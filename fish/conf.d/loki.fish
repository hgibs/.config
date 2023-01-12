if test (ifconfig en0 | grep ether | awk '{print $2}') = "f4:d4:88:68:cd:f8"
	echo "LOKI"
end