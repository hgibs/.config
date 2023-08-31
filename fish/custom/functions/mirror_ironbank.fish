if test "$HOST_ENV_SETTING" = ccri
  function mirror_ironbank
    # docker pull --platform linux/amd64 "$argv[1]"
    set -l oldtag (string replace "docker pull " "" "$argv")
    # echo "docker pull $oldtag"
    docker pull "$oldtag"
    # set -l NEW_TAG artifactory.rtenclave.io/docker-public-local/$argv[1]
    set -l newtag (string replace "registry1.dso.mil" "docker-art.ccri.com" "$oldtag")
    echo "$oldtag -> $newtag"
    docker tag $oldtag $newtag
    docker push $newtag

    set -l PUSH_STATUS $status
    echo "\n"

    if test $PUSH_STATUS -eq 0
      set -l K8S_IMG (docker inspect --format='{{index .RepoDigests 0}}' "$newtag")
      echo "The new docker image:"
      echo "$K8S_IMG"
      echo "$newtag"
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