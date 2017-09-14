# development-environment
Settings for _my_ development environments.

## Chocolately

Chocolately is a package manager, similar to `apt` for Ubuntu. It will let you install software using a command like `choco install docker`.

#### Install with PowerShell

`Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`

## Shell

### Install Hyper

Hyper for Windows is a great alternative to CMD or PowerShell that integrates with the Linux Subsystem so you can use bash and zsh.

https://hyper.is/ or `choco install hyper`

### Install Oh My Zsh

![gentoo for Oh My Zsh](https://github.com/joelnet/development-environment/blob/master/content/oh-my-zsh-gentoo.png)

```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

edit `~/.zshrc` to set the `gentoo` plugin

```
ZSH_THEME="gentoo"
```

more themes here: https://github.com/robbyrussell/oh-my-zsh/wiki/themes

## Visual Studio Code

Settings are self documenting.

```json
// Place your settings in this file to overwrite the default settings
{
  "telemetry.enableTelemetry": false,
  "editor.fontSize": 15,
  "editor.renderWhitespace": "all",
  "editor.tabSize": 2,
  "files.eol": "\n",
  "terminal.integrated.shellArgs.windows": ["-l"],
  "terminal.integrated.fontFamily": "Consolas",
  "terminal.integrated.fontSize": 15,
  "terminal.integrated.shell.windows": "C:\\Windows\\sysnative\\bash.exe",
  "window.zoomLevel": 0,
  "search.exclude": {
    "**/node_modules": true,
    "**/bower_components": true,
    "coverage": true
  },
  "editor.multiCursorModifier": "ctrlCmd"
}
```

## GIT

### Set Author

GIT will just keep complaining unless you set this stuff, so just do it.

`git config --global user.name "Jesse Custer"`

`git config --global user.email "email@example.com"`

### Simple Push

Simple push allows you to do `git push` or `git pull` to push the current branch.

To setup:

`git config --global push.default simple`

Note: You still have to do a one time `git push -u <remote> <remote/branch>` to set the upstream branch.

### Pretty Format Logs

#### Install

Append this `.gitconfig` to your `~/.gitconfig` file.

`curl https://raw.githubusercontent.com/joelnet/development-environment/master/.gitconfig >> ~/.gitconfig`

#### Usage

`git lg`

![GIT log pretty format](https://github.com/joelnet/development-environment/blob/master/content/git-log-pretty.png)

`git lg2`

![GIT log pretty format](https://github.com/joelnet/development-environment/blob/master/content/git-log-pretty2.png)

`git lg3`

![GIT log pretty format](https://github.com/joelnet/development-environment/blob/master/content/git-log-pretty3.png)

courtesy of: https://stackoverflow.com/a/34467298/504836
