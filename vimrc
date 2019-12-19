call plug#begin('~/.vim/plugged')

Plug '~/.fzf'

call plug#end()

execute pathogen#infect()
syntax on
filetype plugin indent on
