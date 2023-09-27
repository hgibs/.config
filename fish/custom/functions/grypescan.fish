function grypescan 
    set -l image $argv[1]
    set -l date (date -u +"%YT%T")
    set -l image_out (echo $image | string replace -a '/' '-') 
    set -l grype_ver (gryperun version | awk '/^Version/ { print $2 }')

    set -l outputfile /tmp/grype-$grype_ver-$image_out-$date.txt
    echo $outputfile
    gryperun $argv > $outputfile
end
