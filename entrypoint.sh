#!/bin/bash

USER_ID=${LOCAL_USER_ID:-9001}

useradd --shell /bin/bash -u $USER_ID -o -c "" -m user
export HOME=/home/user

export BUNDLE_PATH=vendor/bundle

exec sudo -E -u user $cmd bundle "$@"
