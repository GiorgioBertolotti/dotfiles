# Giorgio Bertolotti's dotfiles

Hey there! 👋  
You can check out my work environment here.

**Note**: This is a MacOS setup, and it's very Homebrew oriented.

- [Homebrew](#homebrew)
- [Brewfile](#brewfile)
- [.zshrc](#zshrc)
- [Use sudo with Touch ID](#use-sudo-with-touch-id)
- [Command line tools](#command-line-tools)
- [Raycast](#raycast)
- [Theming](#theming)

# Quick start

## Homebrew

Homebrew is a package manager for MacOS, follow the instructions on [this page](https://brew.sh/) to install it.

## Brewfile

With the help of the *Brewfile*, we can dump the list of brew installed taps, brews and casks.
  
To generate a new Brewfile, run:

	brew bundle dump --force

To restore a configuration, jump in the folder where you have the Brewfile and run:

	brew bundle

# Utils

## .zshrc

Execute the following command to use my already configured *.zshrc*:

	ln -sf dot-files/zshrc_osx ~/.zshrc

## Use sudo with Touch ID

[[guide](https://www.imore.com/how-use-sudo-your-mac-touch-id)] Open the sudo auth file */etc/pam.d/sudo* and add the following line:

	auth sufficient pam_tid.so

## Command line tools

To install command line tools on MacOS use the following command:

	xcode-select --install

## Raycast

I heavily use [Raycast](https://www.raycast.com/) to speed up my workflow.

To generate a new Raycast configuration, open it up and run the `Export Settings & Data` command. You need to select only `Settings` and `Extensions`.

To import my existing configuration you can just open the *Raycast.rayconfig* file.

## Theming

To theme all the apps as I do, check out [Catppuccin](https://catppuccin.com/ports).  
My favorite theme is *Macchiato*.
