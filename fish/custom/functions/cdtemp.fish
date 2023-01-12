function cdtemp
set -f tempdir $(mktemp -d)
cd $tempdir
pwd
end
