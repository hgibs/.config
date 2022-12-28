# FUNCTIONS
random(){
  cat /dev/urandom | env LC_CTYPE=C tr -dc $1 | head -c $2;
  echo;
}

shasum_recent(){
  cd ~/Downloads;
  shasum -a 256 $(ls -t | head -1);
}

push_artifactory () {
  docker pull --platform linux/amd64 "$1"

  NEW_TAG="artifactory.rtenclave.io/docker-public-local/$1"
  docker tag $1 $NEW_TAG
  docker push $NEW_TAG
  STATUS=$?

  echo "\n"

  if [ "$STATUS" -eq 0 ]; then
    K8S_IMG=$(docker inspect --format='{{index .RepoDigests 0}}' "$NEW_TAG")

    echo "To use this image in a manifest, refer to its shasum, i.e.:"
    echo "image: $K8S_IMG"
  else
    echo 'Push failed!! Please log in and try again.'
    echo "docker login artifactory.rtenclave.io"
  fi
}