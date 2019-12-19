# Setup UNIX terminal

## ZSH rules

Update all, install zsh and set zsh as default shell:

	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install zsh
	chsh -s $(which zsh)

If chsh doesn't work, add this at the top of ~/.bashrc:

	if test -t 1; then
	exec zsh
	fi

## Utilities and stuff

Then install git, curl, oh-my-zsh, fonts-powerline, tmux and tmux plugin manager:

	sudo apt-get install git-core
	sudo apt-get install curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	sudo apt-get install fonts-powerline
	git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

Set your shell theme:

	base16_eighties

## ZSH plugins

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

## ripgrep

[https://github.com/BurntSushi/ripgrep#installation](Install ripgrep).  
On Mac:

	brew install ripgrep

On WSL:

	curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
	sudo dpkg -i ripgrep_11.0.2_amd64.deb
	sudo apt-get install libpcre2-8-0

## TMUX

**TMUX only if not on MacOS, iTerm 2 windows management is enought.**

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

## OMZ/zplugin

Execute the following command to use *oh-my-zsh*:

	ln -sf dot-files/omz/zshrc ~/.zshrc

or the following to use *zplugin*:

	ln -sf dot-files/zplugin/zshrc ~/.zshrc