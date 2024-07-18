# Giorgio Bertolotti's dotfiles

Hey there! 👋  
You can check out my work environment here, if you like it please consider supporting my work

**Note**: This is a MacOS setup, and it's very Homebrew oriented.


<a href='https://www.buymeacoffee.com/GiorgioZem' target="_blank"><img alt='Buy me a coffee' src='https://cdn.buymeacoffee.com/buttons/lato-yellow.png' height="38" width="160" /></a>

- [ZSH](#zsh)
- [ZSH plugins](#zsh-plugins)
- [.zshrc](#zshrc)
- [Use sudo with Touch ID](#use-sudo-with-touch-id)
- [Command line tools](#command-line-tools)
- [Homebrew](#homebrew)
- [Quick start](#quick-start)
- [Warp](#warp)
- [CLI Utilities](#cli-utilities)
- [Raycast](#raycast)
- [Spicetify](#spicetify)
- [Theming](#theming)
	- [Telegram Desktop](#telegram-desktop)
	- [Visual Studio Code](#visual-studio-code)

## ZSH

[Zsh](https://www.zsh.org/) is a UNIX shell.  
Install it and set it as default shell:

	brew install zsh
	sudo sh -c "echo $(which zsh) >> /etc/shells" && chsh -s $(which zsh)

## ZSH plugins

Install alias-tips, zsh-autosuggestions and zsh-syntax-highlighting:

	cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins

    # An oh-my-zsh plugin to help remembering those aliases you defined once (https://github.com/djui/alias-tips)
	git clone https://github.com/djui/alias-tips.git

    # Fish-like autosuggestions for zsh (https://github.com/zsh-users/zsh-autosuggestions)
	git clone https://github.com/zsh-users/zsh-autosuggestions zsh-autosuggestions

    # Fish shell like syntax highlighting for Zsh (https://github.com/zsh-users/zsh-syntax-highlighting)
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git zsh-syntax-highlighting

## .zshrc

Execute the following command to use my already configured *.zshrc*:

	ln -sf dot-files/zshrc_osx ~/.zshrc

## Use sudo with Touch ID

[[guide](https://www.imore.com/how-use-sudo-your-mac-touch-id)] Open the sudo auth file */etc/pam.d/sudo* and add the following line:

	auth sufficient pam_tid.so

## Command line tools

To install command line tools on MacOS use the following command:

	xcode-select --install

## Homebrew

Homebrew is a package manager for MacOS, follow the instructions on [this page](https://brew.sh/) to install it.

## Quick start

With the help of the *Brewfile*, we can dump the list of brew installed taps, brews and casks.  
To generate a new Brewfile, run:

	brew bundle dump

To restore a configuration, jump in the folder where you have the Brewfile and run:

	brew bundle

## Warp

Use cask to install Warp as default terminal:

	brew install --cask warp

## CLI Utilities

Then install command-line packages:

    # Distributed revision control system (https://git-scm.com/)
	brew install git

    # A set of efficient branching git extensions (https://jeffkreeftmeijer.com/git-flow/)
	brew install git-flow

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

    # Modern replacement for 'ls' (https://github.com/lsd-rs/lsd)
	brew install lsd

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

To replace the standard `ls` command with `lsd`, add the following lines to *.zshrc*:

	if [ "$(command -v lsd)" ]; then
    alias ls='lsd'
    alias l='ls -l'
    alias la='ls -a'
    alias ll='ls -la'
    alias lla='ls -la'
	fi

The following packages are language specific, but I'd suggest to install them anyway because of their generic purposes:

	brew install python
	brew install sqlite
	brew install node
	brew install go

## Raycast

To install [Raycast](https://www.raycast.com/) use:

	brew install --cask raycast

Once it's installed you can just open the *Raycast.rayconfig* file to import all my settings and extensions.

## Spicetify

[Spicetify](https://github.com/spicetify/spicetify-cli) is a commandline tool to customize Spotify client.  
To install spicetify follow [these instructions](https://spicetify.app/docs/getting-started#linux-and-macos).

## Theming
> To theme all the apps as I do, check out [Dracula](https://draculatheme.com/telegram).

Create a folder in the root of your filesystem and name it Dracula, it will contain all the themes repositories 
for your apps, so that you can easily keep them up-to-date.

	mkdir ~/Dracula
	cd ~/Dracula
	git clone https://github.com/dracula/telegram.git
	git clone https://github.com/dracula/visual-studio-code.git ~/.vscode/extensions/theme-dracula
	cd ~/.vscode/extensions/theme-dracula
	npm install
	npm run build

Check out the following sections to see how to install app specific theme.

### Telegram Desktop

1. In Telegram Desktop, go to setting and under the *Chat background* section click on *Choose from file*.
2. Select the `colors.tdesktop-theme` file you just downloaded.
3. Click *Keep Changes* to apply the theme.

### Visual Studio Code

Run Visual Studio Code. The Dracula Syntax Theme will be available from *File -> Preferences -> Color Theme* dropdown menu.
