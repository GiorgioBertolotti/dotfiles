# Setup UNIX terminal

## Table of contents

- [Setup UNIX terminal](#setup-unix-terminal)
	- [Table of contents](#table-of-contents)
	- [WSL](#wsl)
		- [ZSH](#zsh)
		- [CLI Utilities](#cli-utilities)
		- [ZSH plugins](#zsh-plugins)
		- [TMUX](#tmux)
		- [OMZ/zplugin](#omzzplugin)
	- [MacOS/Linux](#macoslinux)
		- [Use sudo with Touch ID](#use-sudo-with-touch-id)
		- [Command line tools](#command-line-tools)
		- [Homebrew](#homebrew)
		- [iTerm2](#iterm2)
		- [ZSH](#zsh-1)
		- [CLI Utilities](#cli-utilities-1)
		- [Alfred](#alfred)
		- [BetterTouchTool](#bettertouchtool)
		- [Spicetify](#spicetify)
		- [Theming](#theming)
		- [Homebrew casks](#homebrew-casks)

## WSL

### ZSH

Update all, install zsh and set zsh as default shell:

	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install zsh
	chsh -s $(which zsh)

If chsh doesn't work, add this at the top of ~/.bashrc:

	if test -t 1; then
	exec zsh
	fi

### CLI Utilities

Then install git, curl, oh-my-zsh, fonts-powerline, tmux and tmux plugin manager:

	sudo apt-get install git-core
	sudo apt-get install curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	sudo apt-get install fonts-powerline
	git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
	sudo dpkg -i ripgrep_11.0.2_amd64.deb
	sudo apt-get install libpcre2-8-0

Set your shell theme:

	base16_eighties

### ZSH plugins

Install alias-tips, zsh-autosuggestions and zsh-syntax-highlighting:

	cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
	git clone https://github.com/djui/alias-tips.git
	wget https://github.com/djui/alias-tips/archive/master.zip
	unzip master.zip && mv alias-tips-master alias-tips && rm master.zip
	git submodule add -f https://github.com/djui/alias-tips
	git submodule update --init
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	cd
	wget https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/z/z.sh

And add the plugin to *~/.zshrc* :

	plugins=(git alias-tips zsh-autosuggestions zsh-syntax-highlighting z)

### TMUX

	sudo apt-get install tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Put this at the bottom of ~/.tmux.conf:

	set -g @plugin 'tmux-plugins/tpm'
	set -g @plugin 'tmux-plugins/tmux-sensible'
	set -g @plugin 'tmux-plugins/tmux-resurrect'
	run '~/.tmux/plugins/tpm/tpm'

Reload TMUX environment:

	tmux source ~/.tmux.conf

Install new plugins with [Ctrl + b] + I.

### OMZ/zplugin

Execute the following command to use *oh-my-zsh*:

	ln -sf dot-files/omz/zshrc_win ~/.zshrc

or the following to use *zplugin*:

	ln -sf dot-files/zplugin/zshrc ~/.zshrc

## MacOS/Linux

### Use sudo with Touch ID
> MacOS only

[Follow this guide](https://www.imore.com/how-use-sudo-your-mac-touch-id).

### Command line tools
> MacOS only

To install command line tools on MacOS use the following command:

	xcode-select --install

### Homebrew

To install Homebrew on MacOS execute the following command:

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

	# Update the formulas and upgrade your installed packages
	brew update
	brew upgrade

Once finished install Cask:

	brew tap caskroom/cask

### iTerm2
> MacOS only

Use cask to install iTerm2 as default terminal:

	brew cask install iterm2

### ZSH

[Zsh](https://www.zsh.org/) is a UNIX shell.  
Install it and set it as default shell:

	brew install zsh
	sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

#### ZSH plugins

Install alias-tips, zsh-autosuggestions and zsh-syntax-highlighting:

	cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins

	# An oh-my-zsh plugin to help remembering those aliases you defined once (https://github.com/djui/alias-tips)
	git clone https://github.com/djui/alias-tips.git

	# Fish-like autosuggestions for zsh (https://github.com/zsh-users/zsh-autosuggestions)
	git clone https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions

	# Fish shell like syntax highlighting for Zsh (https://github.com/zsh-users/zsh-syntax-highlighting)
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting

And enable the plugins adding the following line to *~/.zshrc* :

	plugins=(git alias-tips zsh-autosuggestions zsh-syntax-highlighting)

#### .zshrc

Execute the following command to use the already configured *.zshrc*:

	ln -sf dot-files/omz/zshrc_osx ~/.zshrc

### CLI Utilities

Then install command-line packages:

	# Distributed revision control system (https://git-scm.com/)
	brew install git

	# Get a file from an HTTP, HTTPS or FTP server (https://curl.haxx.se/)
	brew install curl

	# Framework for managing your Zsh configuration (https://github.com/ohmyzsh/ohmyzsh)
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# Zsh theme (https://github.com/romkatv/powerlevel10k)
	git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

	# Internet file retriever (https://www.gnu.org/software/wget/)
	brew install wget

	# Command-line fuzzy finder written in Go (https://github.com/junegunn/fzf)
	brew install fzf

	# Search tool like grep and The Silver Searcher (https://github.com/BurntSushi/ripgrep)
	brew install ripgrep

	# Clone of cat with syntax highlighting and Git integration (https://github.com/sharkdp/bat)
	brew install bat

	# Display and control your Android device (https://github.com/Genymobile/scrcpy)
	brew install scrcpy

	# Add GitHub support to git on the command-line (https://github.com/github/hub)
	brew install hub

	# Command-line interface for https://speedtest.net bandwidth tests (https://github.com/sivel/speedtest-cli)
	brew install speedtest-cli
	
	# Play, record, convert, and stream audio and video (https://ffmpeg.org/)
	brew install ffmpeg

	# Tools and libraries to manipulate images in many formats (https://imagemagick.org/index.php)
	brew install imagemagick

	# Modern replacement for 'ls' (https://github.com/ogham/exa)
	brew install exa

	# Syntax-highlighting pager for git and diff output (https://github.com/dandavison/delta)
	brew install git-delta

	# Shell extension to navigate your filesystem faster (https://github.com/ajeetdsouza/zoxide)
	brew install zoxide

To use `bat` instead of `cat`, add the following line to *.zshrc*:

	alias cat="bat"

To use `speed` as an alias to execute the `speedtest-cli`, add the following line to *.zshrc*:

	alias speed="speedtest-cli"

To enable `zoxide` add the following line to *.zshrc*:

	eval "$(zoxide init zsh)"

To replace the standard `ls` command with `exa`, add the following lines to *.zshrc*:

	if [ "$(command -v exa)" ]; then
			unalias -m 'll'
			unalias -m 'l'
			unalias -m 'la'
			unalias -m 'ls'
			alias ll='exa -l --color always --icons -a -s type'
			alias l='exa -l --color always --icons -a -s type'
			alias la='exa -l --color always --icons -a -s type'
			alias ls='exa -G  --color auto --icons -a -s type'
	fi

The following packages are language specific, but I'd suggest to install them anyway because of their generic purposes:

	brew install python
	brew install sqlite
	brew install node
	brew install go

### Alfred
> MacOS only

To install Alfred use:

	brew cask install alfred

Once it's installed you can double click the files in the folder *alfred* to install extensions and themes.  
Also, to use the *Alfred Bluetooth Controller* extension you should install [blueutil](http://www.frederikseiffert.de/blueutil/) and python3:

	# Get/set bluetooth power and discoverable state (https://github.com/toy/blueutil)
	brew install blueutil

	brew install python3

### BetterTouchTool
> MacOS only

To install BTT use:

	brew cask install bettertouchtool 

Once it's installed open it up and import [the preset](Zem.bttpreset).  

### Spicetify

[Spicetify](https://github.com/khanhas/spicetify-cli) is a commandline tool to customize Spotify client.  
To install spicetify use:

	brew install khanhas/tap/spicetify-cli

then run `spicetify` with no options to generate config file.  
Then run:

	spicetify backup apply enable-devtool

to setup the basic configuration.  
To install the Spicetify themes, copy the content of `./spicetify-themes/` in the folder `$(dirname "$(spicetify -c)")/Themes`.  
Then add the extensions and apply the configuration with the following commands:

	# Pick a theme between google-spicetify and Nord
	spicetify config current_theme [google-spicetify/Nord/Dracula]
	spicetify config color_scheme Dark
	spicetify config extensions shuffle+.js
	spicetify config extensions trashbin.js
	spicetify config custom_apps reddit
	spicetify apply

### Theming
> To theme all the apps as I do, check out [Dracula](https://draculatheme.com/telegram).

Create a folder in the root of your filesystem and name it Dracula, it will contain all the themes repositories 
for your apps, so that you can easily keep them up-to-date.

	mkdir ~/Dracula
	cd ~/Dracula
	git clone https://github.com/dracula/alfred
	git clone https://github.com/dracula/iterm.git
	git clone https://github.com/dracula/telegram.git
	git clone https://github.com/dracula/visual-studio-code.git ~/.vscode/extensions/theme-dracula
	cd ~/.vscode/extensions/theme-dracula
	npm install
	npm run build

Check out the following sections to see how to install app specific theme.

#### Alfred

Just double-click `Dracula.alfredappearance`.

#### iTerm

1. *iTerm2 > Preferences > Profiles > Colors Tab*
2. Open the *Color Presets...* drop-down in the bottom right corner
3. Select *Import...* from the list
4. Select the `Dracula.itermcolors` file
5. Select the *Dracula* from Color *Presets...*

**NB:** If `base16-shell` is active you must comment its activation out from *.zshrc*.

#### Telegram Desktop

1. In Telegram Desktop, go to setting and under the *Chat background* section click on *Choose from file*.
2. Select the `colors.tdesktop-theme` file you just downloaded.
3. Click *Keep Changes* to apply the theme.

#### Visual Studio Code

Run Visual Studio Code. The Dracula Syntax Theme will be available from *File -> Preferences -> Color Theme* dropdown menu.

### Homebrew casks
> MacOS only

The following are commands to install my most commonly used apps through `cask`:

	brew cask install visual-studio-code
	brew cask install macupdater
	brew cask install vlc
	brew cask install appcleaner
	brew cask install font-fira-code
	brew cask install licecap
	brew cask install android-platform-tools
	brew cask install fastlane
	brew cask install folx
	brew cask install telegram-desktop
	brew cask install discord
