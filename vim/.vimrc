set nocompatible

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

Plugin 'VundleVim/Vundle.vim'
Plugin 'gruvbox'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'

" All of your Plugins must be added before the following line
call vundle#end()            " required

colorscheme gruvbox

syntax on
filetype on
filetype indent on
filetype plugin on

set ruler
set number
set showcmd

set background=dark

" vim-airline setting
set laststatus=2
