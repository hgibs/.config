#!/usr/bin/env python3

import socket
from pathlib import Path
import os

hostname = socket.gethostname()
config_location = Path("{}/dotfiles/kitty/overrides/{}.conf".format(os.environ['HOME'], hostname)).absolute()
print("# config location: {}".format(config_location))
if config_location.exists():
    print("include {}".format(config_location))
