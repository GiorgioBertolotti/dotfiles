## ISTRUZIONI PER SETUP TERMINALE
	sudo apt-get update
	sudo apt-get upgrade
	sudo apt-get install zsh
	chsh -s $(which zsh)

If chsh doesn't work, add this at the top of ~/.bashrc:
	if test -t 1; then
	exec zsh
	fi

	sudo apt-get install git-core
	sudo apt-get install curl
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	sudo apt-get install fonts-powerline
	sudo apt-get install tmux
	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

Put this at the bottom of ~/.tmux.conf:
	set -g @plugin 'tmux-plugins/tpm'
	set -g @plugin 'tmux-plugins/tmux-sensible'
	set -g @plugin 'tmux-plugins/tmux-resurrect'
	run '~/.tmux/plugins/tpm/tpm'

	tmux source ~/.tmux.conf
[Ctrl + b] + I
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

	base16_darktooth

