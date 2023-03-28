if test "$HOST_ENV_SETTING" = loki
	function push_artifactory
	  docker pull --platform linux/amd64 "$argv[1]"
	  set -f NEW_TAG artifactory.rtenclave.io/docker-public-local/$argv[1]
	  docker tag $argv[1] $NEW_TAG
	  docker push $NEW_TAG

	  set -f PUSH_STATUS $status
	  echo "\n"

	  if test $PUSH_STATUS -eq 0
	  	set -l K8S_IMG $(docker inspect --format='{{index .RepoDigests 0}}' "$NEW_TAG")
	  	echo "To use this image in a manifest, refer to its shasum, i.e.:"
    	echo "image: $K8S_IMG"
    else
    	echo 'Push failed!! Please log in and try again.'
    	echo "docker login artifactory.rtenclave.io"
	  end
	end
end

## BASH style:
# push_artifactory () {
#   docker pull --platform linux/amd64 "$1"

#   NEW_TAG="artifactory.rtenclave.io/docker-public-local/$1"
#   docker tag $1 $NEW_TAG
#   docker push $NEW_TAG
#   STATUS=$?

#   echo "\n"

#   if [ "$STATUS" -eq 0 ]; then
#     K8S_IMG=$(docker inspect --format='{{index .RepoDigests 0}}' "$NEW_TAG")

#     echo "To use this image in a manifest, refer to its shasum, i.e.:"
#     echo "image: $K8S_IMG"
#   else
#     echo 'Push failed!! Please log in and try again.'
#     echo "docker login artifactory.rtenclave.io"
#   fi
# }