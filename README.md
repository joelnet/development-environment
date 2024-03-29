# development-environment
Settings for _my_ development environments. I have a mix of Windows and Linux boxes which is why you will find a mix of Windows and Linux commands. On Windows I use the Linux Subsystem.

## Mac

### Android Mirror scrcpy

https://github.com/Genymobile/scrcpy

```bash
# install scrcpy
brew install scrcpy
brew install android-platform-tools

# install autoadb
git clone https://github.com/rom1v/autoadb.git
cd autoadb
cargo build --release
```

Setup auto start on login

```bash
vim ~/autoadb/start-autoadb.sh
```

paste in:

```bash
#!/bin/sh

/Users/joel/autoadb/target/release/autoadb scrcpy --turn-screen-off -s '{}'
```

create `autoscrcpy.plist`

```bash
vim /Library/LaunchAgents/autoscrcpy.plist
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
        <key>EnvironmentVariables</key>
        <dict>
                <key>PATH</key>
                <string>/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/joel/.cargo/bin</string>
        </dict>
        <key>Label</key>
        <string>autoadb</string>
        <key>Program</key>
        <string>/Users/joel/autoadb/start-autoadb.sh</string>
        <key>RunAtLoad</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>/Users/joel/autoadb/autoadb.log</string>
        <key>StandardOutPath</key>
        <string>/Users/joel/autoadb/autoadb.log</string>
</dict>
</plist>
```



## Windows

### Putty

Color scheme for putty

![Putty Terminal View](https://darekkay.com/blog/my-putty-color-scheme/ls-eclectide.png)

https://darekkay.com/blog/my-putty-color-scheme/

## Chocolately

Chocolately is a package manager for Windows, similar to `apt` for Ubuntu. It will let you install software using a command like `choco install docker`.

#### Install with PowerShell

```
Set-ExecutionPolicy AllSigned; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

## Shell

### Install Hyper

Hyper for Windows is a great alternative to CMD or PowerShell that integrates with the Linux Subsystem so you can use bash and zsh.

https://hyper.is/ or `choco install hyper`

#### Configure Hyper for Linux Subsystem

Drop custom [.hyper.js](./content/.hyper.js) into C:\Users\<User>\

### Install Oh My Zsh

![gentoo for Oh My Zsh](https://github.com/joelnet/development-environment/blob/master/content/oh-my-zsh-gentoo.png)

```
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install zsh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

edit `~/.zshrc` to set the `gentoo` theme

```
ZSH_THEME="gentoo"
```

add the `ssh-agent` plugin

* https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/ssh-agent

more themes here: https://github.com/robbyrussell/oh-my-zsh/wiki/themes

### ZSH Aliases for Windows

Add the ability to launch applications from the shell.

Examples could be `code file.txt` or `code .` or `explorer .`

```
# Custom Alias
alias code="/mnt/c/Program\ Files/Microsoft\ VS\ Code/Code.exe"
alias explorer="/mnt/c/Windows/explorer.exe"
```

### exa

alternative to `ls` that also shows `git status` in list. (notice the M next to README.md)

![exa](https://github.com/joelnet/development-environment/blob/master/content/exa.png)

exa also has a tree view

![exa](https://github.com/joelnet/development-environment/blob/master/content/exa2.png)

```sh
# Install Rust
# (for WSL)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install exa
cargo install exa
```

Add the alias `lsx` to `~/.zshrc`

```sh
alias ll="exa -lga --git --group-directories-first"
```

reload

```
source ~/.zshrc
```

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
### Extensions

* [C# for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.csharp&dotnetid=1995460832.1502310825)
* [Git Lens — git blame annotations, code lens, and more](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
* [ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)
* [Import Cost](https://marketplace.visualstudio.com/items?itemName=wix.vscode-import-cost)
* [Quokka.js](https://marketplace.visualstudio.com/items?itemName=WallabyJs.quokka-vscode)

## Node

### Node Version Management

Even if you don't switch between node versions often, `n` makes upgrades no-brain-simple.

`npm install -g n`

Useful commands:

```
sudo n latest
sudo n stable
sudo n lts
```

more docs at https://github.com/tj/n

## GIT

#### Debian Install

`apt-get install git`

#### Windows Install (Chocolately)

`choco install git`

### Set Author

GIT will just keep complaining unless you set this stuff, so just do it.

```
git config --global user.name "Jesse Custer"
git config --global user.email "email@example.com"
```

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

### Git Colors

Add colors to your GIT by appending this to your `~/.gitconfig` file.

```
[apply]
        whitespace = nowarn
[color]
        branch = auto
        diff = auto
        status = auto
[color "branch"]
        current = yellow reverse
        local = yellow
        remote = green
[color "diff"]
        meta = yellow bold
        frag = magenta bold
        old = red bold
        new = green bold
[color "status"]
        added = yellow
        changed = green
        untracked = cyan
```

