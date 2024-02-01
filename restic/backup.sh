#!/usr/bin/env bash

# password is in the password.secret file

source password.secret

restic -r sftp:macb14@nas.home.hollandgibson.com:/mnt/Saturn/macbook14/restic/teal cat config

