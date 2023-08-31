function docker_push_all
    set -l images (docker image ls --format "{{.Repository}}:{{.Tag}}" | grep 'docker-art.ccri.com')

    echo $images | string split ' '
    
    read -l -P "Do all the following images look good to push? [y/N]" user_assent
    if test $user_assent = "y"
        for image in $images
            echo "docker image push $image"
            docker image push "$image"
        end
    else
        echo "exiting"
    end
end
