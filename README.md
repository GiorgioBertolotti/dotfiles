## ISTRUZIONI PER SETUP TERMINALE

Update all, install zsh and set zsh as default shell:

	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install zsh
	chsh -s $(which zsh)

If chsh doesn't work, add this at the top of ~/.bashrc:

	if test -t 1; then
	exec zsh
	fi

Then install git, curl, oh-my-zsh, fonts-powerline, tmux and tmux plugin manager:

	sudo apt-get install git-core
	sudo apt-get install curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	sudo apt-get install fonts-powerline
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
	sudo apt-get install tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Put this at the bottom of ~/.tmux.conf:

	set -g @plugin 'tmux-plugins/tpm'
	set -g @plugin 'tmux-plugins/tmux-sensible'
	set -g @plugin 'tmux-plugins/tmux-resurrect'
	run '~/.tmux/plugins/tpm/tpm'

Reload TMUX environment:

	tmux source ~/.tmux.conf

Install new plugins with [Ctrl + b] + I and then install base16-shell and fzf:

	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install

Add at the bottom of ~./zshrc:

	BASE16_SHELL=$HOME/.config/base16-shell/
	[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
	[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
	if [[ -z "$TMUX" ]]
	then
	    ID="`tmux ls | grep -vm1 attached | cut -d: -f1`"
	    if [[ -z "$ID" ]]
	    then
	        tmux new-session
	    else
	        tmux attach-session -t "$ID"
	    fi
	fi

Set your shell theme:

	base16_eighties

Install alias-tips, zsh-autosuggestions and zsh-syntax-highlighting:

	cd ${ZSH_CUSTOM1:-$ZSH/custom}/plugins
	git clone https://github.com/djui/alias-tips.git
	wget https://github.com/djui/alias-tips/archive/master.zip
	unzip master.zip && mv alias-tips-master alias-tips && rm master.zip
	git submodule add https://github.com/djui/alias-tips
	git submodule update --init
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

And add the plugin to *~/.zshrc* :

	plugins=(git alias-tips zsh-autosuggestions zsh-syntax-highlighting)
