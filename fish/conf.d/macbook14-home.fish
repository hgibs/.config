if test (ifconfig en0 | grep ether | awk '{print $2}') = "f8:4d:89:69:83:59"
	echo "HOME"
end