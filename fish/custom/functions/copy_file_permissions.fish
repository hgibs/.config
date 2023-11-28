function copy_file_permissions -a srcfile destfile
  if command -v coreutils &>/dev/null  # works with Nixpkgs-installed coreutils on Mac
    coreutils --coreutils-prog=chmod --reference=$srcfile -- $destfile
  else if command -v gchmod &>/dev/null  # works w/ Homebrew coreutils on Mac
    gchmod --reference=$srcfile -- $destfile
  else
    # hope that just "chmod" is the GNU version, or --reference won't work
    chmod --reference=$srcfile -- $destfile
  end
end
