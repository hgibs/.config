if test "$HOST_ENV_SETTING" = ccri
    function mirror_ghcr
        # docker pull --platform linux/amd64 "$argv[1]"
        set -l oldtag (string replace "docker pull " "" "$argv")
        # echo "docker pull $oldtag"
        docker pull "$oldtag"
        # set -l NEW_TAG artifactory.rtenclave.io/docker-public-local/$argv[1]
        set -l no_url_tag (string replace "ghcr.io/" "" "$oldtag")
        set -l url "docker-art.ccri.com"
        set -l newtag "docker-art.ccri.com/$no_url_tag"
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
