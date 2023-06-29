function cdtemp
    set -l tempdir (mktemp -d)
    cd $tempdir
    pwd
end
