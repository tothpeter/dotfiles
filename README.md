# Peter's Dotfiles

Tools and shortcuts I use daily for software development.

## Example usage

```bash
# Git update: Pull all the changes to the local main Git branch, rebase the current branch on top of it, and remove all deleted remote branches. Works even if you have uncommitted changes.
$ gupd
# Git: Discard all changes
$ nah
# Git X: Open the current Git repository in SourceTree. (even if the Git folder is several levels up)
$ gx
# Git amend: amend all staged or unstaged changes to the last commit. Very useful for TDD.
$ gam
# Git rebase interactive all: Starts an interactive rebase for all the commits on the current branch.
$ grbia
# Git rebase fixups: squash all fixup commits into the right commits.
$ grb_fixups
```

Create a new SourceTree custom actions for `git/sourcetree_custom_actions/create_fixup_commit.sh`. Follow the instructions in the file. Then right click on a commit, Custom Actions > `Fixup`. It will create a fixup commit for the selected commit using the files added to staging.

Check out the rest of the custom actions in `git/sourcetree_custom_actions`.

Put any custom variables.sh, aliases.sh, functions.sh or .rb in `local` and they will be loaded recursively and automatically.

### Run any RSpec in the current iTerm2 tab from VS Code by pressing a button

Install the [Commands VS Code extension](https://marketplace.visualstudio.com/items?itemName=fabiospampinato.vscode-commands)

Add the following to your VS Code settings.json:

```json
{
  "command": "workbench.action.tasks.runTask",
  "arguments": ["run_rspec"],
  "text": "$(play)$(beaker) File",
  "tooltip": "File",
  "alignment": "left",
  "color": "#fff",
  "filterLanguageRegex": "ruby"
},
{
  "command": "workbench.action.tasks.runTask",
  "arguments": ["run_rspec_for_current_line"],
  "text": "$(play)$(beaker) Line",
  "tooltip": "Line",
  "alignment": "left",
  "color": "#fff",
  "filterLanguageRegex": "ruby"
}
```

Add the following to your VS Code tasks.json:

```json
{
  "version": "2.0.0",
  "tasks": [
    // AppleScript
    {
      "label": "run_rspec",
      "type": "shell",
      "command": "osascript",
      "args": [
        "~/.dotfiles/iTerm/run_rspec.scpt", // The script is in this repo, don't forget to copy it and change the path
        "${relativeFile}"
      ],
      "presentation": {
        "reveal": "never",
        "focus": false
      }
    },
    // Python
    {
      "label": "run_rspec_for_current_line",
      "type": "shell",
      "command": "~/.asdf/shims/python3", // CHANGE THIS TO YOUR PYTHON PATH
      "args": [
        "~/.dotfiles/iTerm/run_rspec.py", // The script is in this repo, don't forget to copy it and change the path
        "${relativeFile}:${lineNumber}"
      ],
      "presentation": {
        "reveal": "never",
        "focus": false
      }
    },
    // AppleScript
    {
      "label": "run_rspec_for_current_line_apple_script",
      "type": "shell",
      "command": "osascript",
      "args": [
        "~/.dotfiles/iTerm/run_rspec.scpt", // The script is in this repo, don't forget to copy it and change the path
        "${relativeFile}:${lineNumber}"
      ],
      "presentation": {
        "reveal": "never",
        "focus": false
      }
    }
  ]
}
```

Open a spec file and press the "beaker" button in the statusbar.

## Install

```bash
git clone git@github.com:tothpeter/dotfiles.git
mv ~/dotenv ~/.dotenv
# Homebrew https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## VS Code

### Sync config

```bash
ln -s ~/.dotfiles/vs_code/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/.dotfiles/vs_code/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/.dotfiles/vs_code/tasks.json ~/Library/Application\ Support/Code/User/tasks.json
ln -s ~/.dotfiles/vs_code/snippets/ ~/Library/Application\ Support/Code/User/snippets
```

### Make `code` command available in the terminal

Command Palette > shell command

## iTerm2

### Sync config

```bash
# Specify the preferences directory
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iTerm/settings"

# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
```

### Turn off the login banner ("Last login ...")

```bash
touch ~/.hushlogin
```

## Oh My ZSH

### Install

https://ohmyz.sh/#install

### Sync config

```bash
mv ~/.zshrc ~/.zshrc.old
ln -s ~/.dotfiles/zsh/zshrc.symlink ~/.zshrc
```

### zsh-syntax-highlighting plugin

It has to be listed LAST in the plugins list in `~/.zshrc` for it to be enabled.

```bash
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### Setup local secrets

```bash
touch $DOTFILES/.localrc
```

## Git

### Sync config

```bash
ln -s ~/.dotfiles/git/.gitconfig.global ~/.gitconfig
```

### Signing commits with GPG

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

## asdf

### Install

```bash
brew install asdf
```

### Update

```bash
asdf plugin-update ruby
```

## Ruby

### Install

```bash
asdf plugin add ruby
asdf install ruby latest
asdf global ruby latest # set global ruby version
```

### Initial Set-up

```bash
ln -s ~/.dotfiles/ruby/irbrc.symlink ~/.irbrc
ln -s ~/.dotfiles/ruby/gemrc.symlink ~/.gemrc
```

### Install Rails and Bundler

```bash
gem install rails
gem install bundler
```


## Other tools

```bash
brew install thefuck
brew install direnv
```

### VLC

```bash
mv -v ~/Library/Preferences/org.videolan.vlc/vlcrc ~/.dotfiles/others/vlc/vlcrc
ln -s ~/.dotfiles/others/vlc/vlcrc ~/Library/Preferences/org.videolan.vlc/vlcrc
```
