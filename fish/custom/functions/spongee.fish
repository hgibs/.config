# mirrors `sponge` util
function spongee -a destname
  set tempfile (mktemp -t $destname.XXXXXX)
  if test -e $destname
    copy_file_permissions $destname $tempfile
  end
  cat >$tempfile
  mv -- $tempfile $destname
end
