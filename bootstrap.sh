#!/usr/bin/env bash

set -e # Exit if any fail
set -o pipefail

#!/usr/bin/env bash

if [ "$(uname)" == "Darwin" ]; then
  # Do something under Mac OS X platform        
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
  # Do something under GNU/Linux platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
  # Do something under 32 bits Windows NT platform
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
  # Do something under 64 bits Windows NT platform
fi

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
