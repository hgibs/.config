import socket
from pathlib import Path
import os

hostname = socket.gethostname()
config_location = Path("./overrides/{}.conf".format(hostname))
if config_location.exists():
    print("include {}/.config/kitty/{}".format(os.environ['HOME'], config_location))
    print("background red")
