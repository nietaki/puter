# My 'puter.

Setting up a computer is annoying, so let's automate it.

## Usage

```sh
wget -O - https://raw.githubusercontent.com/nietaki/puter/master/bootstrap.sh | bash
cd ~/repos/puter
./puter ubuntu_desktop.yml
```

If it's a remote computer you might have to setup openssh server on it first, locally

```sh
sudo apt install openssh-server
```

Ssh to the machine once first to get around some host key checking issues

Tada!

## What doesn't it set up?

Well it doesn't set everything up in one go, the script needs
to be re-run a couple of times and you need to add the generated ssh key to github
in order for some git clones to succeed.

Also:

- pCloud

### SSH agent
It doesn't add the ssh key to the ssh-agent. You need to run:

```sh
ssh-add
```
and enter the ssh passphrase to add it to ssh-agent

You'll need to add the public key (displayed during putering)
to your GitHub account in the browser.

### Changing the shell

It does change the shell (to zsh) but you need to reboot the
machine afterwards anyways.

### NeoVim finishing touches

`SPC p u` to update plugins (and install fzf)

### setting up duckdns

## TODO
- [x] separate task for ssh keys
- [x] elliminate ansible deprecation warnings
- [x] checking the ubuntu codename instead of setting it in vars
- [x] rtx instead of asdf
