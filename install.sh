#!/usr/bin/env sh

set -e

if ! sudo -v; then
  echo "Superuser not granted, aborting installation"
  exit 1
fi

REPO_URL='https://github.com/brendonovich/.dotfiles'
DOWNLOAD_PATH='/tmp/.dotfiles'
INSTALL_PATH='$HOME/.dotfiles'

curl -L -o $DOWNLOAD_PATH $REPO_URL/tarball/master

mkdir -p $INSTALL_PATH
sudo tar -xzof $DOWNLOAD_PATH -C $INSTALL_PATH --strip-components=1

$INSTALL_PATH/setup.sh
