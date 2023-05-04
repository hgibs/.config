#!/usr/bin/env bash
mkdir -p $HOME/.local/share/fonts
# Download latest: 
curl https://api.github.com/repos/source-foundry/Hack/releases | jq '.[0].assets[]|select(.name | endswith("ttf.zip")).browser_download_url'
