function prepend -a stringToPrepend outputName
  begin
    echo $stringToPrepend
    cat -- $outputName
  end | spongee $outputName
end
