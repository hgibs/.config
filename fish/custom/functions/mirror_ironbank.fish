function mirror_ironbank
    argparse --name=mirror_ironbank --min-args 1 'h/help' -- $argv
    or return 1

    if set -q _flag_help
        echo "Usage: mirror_ironbank [image tag]\nExample: mirror_ironbank registry1.dso.mil/ironbank/opensource/apache/tomcat-openjdk8:10.1.7"
        return 1
    end

    if not set -q argv[1]
        echo "Expected an argument"
        return 1
    end
    
    string match -q 'registry1.dso.mil*' $argv[1]
    if test $status -ne 0
        echo "Please supply a tag starting with registry1.dso.mil"
        return 1
    end

    set -l rest_of_parts (string split 'registry1.dso.mil/' $argv[1])
    set -l ccri_tag "docker-art.ccri.com/$rest_of_parts[2]"

    set -l fish_trace 1
   
    docker pull $argv[1]
    docker tag $argv[1] $ccri_tag
    docker push $ccri_tag
end