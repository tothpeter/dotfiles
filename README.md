# Peter's Dotfiles

Install
=======

```bash
git clone git@github.com:tothpeter/dotfiles.git
mv ~/dotenv ~/.dotenv
```

iTerm2
======

## Sync Configs

```bash
# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iTerm/settings"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
```

zshrc
=====

## Symlink `.zshrc`

```bash
mv ~/.zshrc ~/.zshrc.old
ln -s ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
```

## zsh-syntax-highlighting plugin

It has to be listed LAST in the plugins list in `~/.zshrc` for it to be enabled.

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

Git
===

### To sign commits with GPG

```bash
brew install gpg
ln -s /Volumes/DriveD/Dropbox/work/system/.gnupg ~/.gnupg
```

#### Sourcetree

```bash
ln `brew --prefix gpg`/bin/gpg `brew --prefix gpg`/bin/gpg2
```

Sourcetree > Preferences > Advanced > set custom path for GPG Program to `brew --prefix gpg`/bin/gpg

Sourcetree > Repo settings > Security > Enable GPG signing

Sourcetree > commit > Commit options > Sign commit

VS Code
=======

Command Palette > shell command

asdf
====

### Install

```bash
brew install asdf
```

### Update

```bash
asdf plugin-update ruby
```

Ruby
====

## Install

```bash
asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest # set global ruby version
```

## Initial Set-up

```bash
ln -s ~/.dotfiles/ruby/irbrc.symlink ~/.irbrc
ln -s ~/.dotfiles/ruby/gemrc.symlink ~/.gemrc
```

#### Install Rails and Bundler

```bash
gem install rails
gem install bundler
```
