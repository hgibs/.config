#!/usr/bin/env bash

export PROFILE=/dev/null 
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash

nvm install --latest-npm 20.5.1
