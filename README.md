# cchuang’s dotfiles

Borrowed from https://github.com/mathiasbynens/dotfiles.git

## Installation

### Using Git and the bootstrap script

```bash
git clone https://github.com/cchuang/dotfiles.git && cd dotfiles && source bootstrap.sh
```

To update, `cd` into your local `dotfiles` repository and then:

```bash
source bootstrap.sh
```

Alternatively, to update while avoiding the confirmation prompt:

```bash
set -- -f; source bootstrap.sh
```

### Git-free install

To install these dotfiles without Git:

```bash
cd; curl -#L https://github.com/cchuang/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,bootstrap.sh,.osx,LICENSE-MIT.txt}
```

To update later on, just run that command again.

### Install Homebrew formulae

When setting up a new Mac, you may want to install some common [Homebrew](http://brew.sh/) formulae (after installing Homebrew, of course):

```bash
./brew.sh
```

## Thanks to…

* [Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles repository](https://github.com/mathiasbynens/dotfiles)
