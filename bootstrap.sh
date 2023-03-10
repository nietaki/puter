#!/usr/bin/env bash

set -e # Exit if any fail
set -o pipefail

if [[ ! -f ~/.ssh/id_rsa.pub ]]; then
  echo "ssh keys don't exist, will generate..."
  read -r -s -p "Password: " password
  echo ""
  read -r -s -p "Confirm Password: " confirm

  if [[ "$password" != "$confirm" ]]; then
    echo "passwords don't match, exiting"
    exit 1
  fi

  ssh-keygen -t rsa -b 4096 -N "$password" -f ~/.ssh/id_rsa -C "hello@nietaki.com"
else
  echo "public key already exists"
fi

echo ""
cat ~/.ssh/id_rsa.pub
echo ""
echo "Add the above key to your github to make the clone possible"
read -r -p "press enter to continue"
echo ""

mkdir -p ~/repos
if [[ ! -d ~/repos/puter ]]; then
  git clone git@github.com:nietaki/puter.git ~/repos/puter
else
  echo "$HOME/repos/puter already exists and won't be cloned"
fi
