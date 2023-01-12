function shasum_recent
cd ~/Downloads 
shasum -a 256 $(command ls -t | head -1)
end
