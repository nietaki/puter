# My 'puter.

Setting up a computer is annoying, so let's automate it.


## Usage

```sh
puter ubuntu.yml
```

Tada!

## What doesn't it set up?

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
