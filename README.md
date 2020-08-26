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
	- [MacOS](#macos)
		- [Use sudo with Touch ID](#use-sudo-with-touch-id)
		- [Command line tools](#command-line-tools)
		- [Homebrew](#homebrew)
		- [iTerm2](#iterm2)
		- [ZSH](#zsh-1)
		- [CLI Utilities](#cli-utilities-1)
		- [Alfred](#alfred)
		- [BetterTouchTool](#bettertouchtool)
		- [Spicetify](#spicetify)
		- [ZSH plugins](#zsh-plugins-1)
		- [.zshrc](#zshrc)
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

## MacOS

### Use sudo with Touch ID

[Follow this guide](https://www.imore.com/how-use-sudo-your-mac-touch-id).

### Command line tools

To install command line tools on MacOS use the following command:

	xcode-select --install

### Homebrew

To install Homebrew on MacOS execute the following command:

	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Once finished install Cask:

	brew tap caskroom/cask

### iTerm2

Use cask to install iTerm2 as default terminal:

	brew cask install iterm2

### ZSH

Update all, install zsh and set zsh as default shell:

	brew update
	brew upgrade
	brew install zsh
	sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

### CLI Utilities

Then install command-line packages:

	brew install git-core
	brew install curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
	brew install wget
	brew install fzf
	brew install ripgrep
	brew install bat
	brew install scrcpy
	brew install hub
	brew install speedtest-cli
	brew install ffmpeg
	brew install imagemagick
	brew install exa
	brew install git-delta
	brew install zoxide

To use bat instead of cat, add the following line to the *.zshrc*:

	alias cat="bat"

To use `speed` as an alias to execute the speedtest, add the following line to the *.zshrc* file:

	alias speed="speedtest-cli"

The following packages are language specific, but I'd suggest to install them anyway because of their generic purposes:

	brew install python
	brew install sqlite
	brew install node
	brew install go

### Alfred

To install Alfred use:

	brew cask install alfred

Once it's installed you can double click the files in the folder *alfred* to install extensions and themes.  
Also, to use the *Alfred Bluetooth Controller* extension you should install [blueutil](http://www.frederikseiffert.de/blueutil/) and python3:

	brew install blueutil
	brew install python3

### BetterTouchTool

To install BTT use:

	brew install bettertouchtool

Once it's installed open it up and import [the preset](Zem.bttpreset).  

### Spicetify

To install spicetify use:

	brew install khanhas/tap/spicetify-cli

then run `spicetify` with no options to generate config file.  
Then run:

	spicetify backup apply enable-devtool

to setup the basic configuration.  
To install the Spicetify themes, copy the content of `./spicetify-themes/` in the folder `$(dirname "$(spicetify -c)")/Themes`.  
Then add the extensions and apply the configuration with the following commands:

	# Pick a theme between google-spicetify and Nord
	spicetify config current_theme [google-spicetify/Nord]
	spicetify config color_scheme Dark
	spicetify config extensions shuffle+.js
	spicetify config extensions trashbin.js
	spicetify config custom_apps reddit
	spicetify apply

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

And add the plugin to *~/.zshrc* :

	plugins=(git alias-tips zsh-autosuggestions zsh-syntax-highlighting)

### .zshrc

Execute the following command to use the already configured *.zshrc*:

	ln -sf dot-files/omz/zshrc_osx ~/.zshrc

### Homebrew casks

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
