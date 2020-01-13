# My 'puter.

Setting up a computer is annoying, so let's automate it.


## Usage

```sh
cd laptop
puter ubuntu.yml
```

Tada!

## What doesn't it set up?

It doesn't add the ssh key to the ssh-agent. You need to run:

```sh
ssh-add
```
and enter the ssh passphrase to add it to ssh-agent
