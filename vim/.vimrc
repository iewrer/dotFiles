
if 0 | endif

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'gruvbox'
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'tpope/vim-dispatch'
"NeoBundle 'rdnetto/YCM-Generator'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'https://github.com/scrooloose/nerdcommenter.git'
"NeoBundle 'Valloric/YouCompleteMe', {
			"\ 'build'      : {
			"\ 'mac'     : './install.py --clang-completer --system-libclang --system-boost',
			"\ 'unix'    : './install.py',
			"\ 'windows' : 'install.py',
			"\ 'cygwin'  : './install.py'
			"\ }
			"\ }
NeoBundle 'https://github.com/Shougo/neocomplete.vim.git'
NeoBundle 'https://github.com/scrooloose/nerdtree.git'
NeoBundle 'https://github.com/edkolev/tmuxline.vim.git'
NeoBundle 'https://github.com/vim-ctrlspace/vim-ctrlspace.git'
"NeoBundle 'https://github.com/scrooloose/syntastic.git'
"NeoBundle 'https://github.com/kien/rainbow_parentheses.vim.git'
NeoBundle 'https://github.com/xolox/vim-easytags'
NeoBundle 'https://github.com/xolox/vim-misc'
NeoBundle 'https://github.com/majutsushi/tagbar.git'
"NeoBundle 'https://github.com/kien/ctrlp.vim.git'
NeoBundle 'https://github.com/ctrlpvim/ctrlp.vim.git'
NeoBundle 'https://github.com/vim-scripts/ctags.vim.git'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

call neobundle#end()

" common setting
set hidden

set tabstop=4
set shiftwidth=4

set hlsearch

set ruler
set number
set showcmd
set nu rnu

filetype on
filetype indent on
filetype plugin on
syntax enable
syntax on

set backupdir=/tmp
set directory=/tmp

let g:neobundle#install_process_timeout = 1500

" rainbow_parentheses setting
"let g:rbpt_colorpairs = [
    "\ ['brown',       'RoyalBlue3'],
    "\ ['Darkblue',    'SeaGreen3'],
    "\ ['darkgray',    'DarkOrchid3'],
    "\ ['darkgreen',   'firebrick3'],
    "\ ['darkcyan',    'RoyalBlue3'],
    "\ ['darkred',     'SeaGreen3'],
    "\ ['darkmagenta', 'DarkOrchid3'],
    "\ ['brown',       'firebrick3'],
    "\ ['gray',        'RoyalBlue3'],
    "\ ['black',       'SeaGreen3'],
    "\ ['darkmagenta', 'DarkOrchid3'],
    "\ ['Darkblue',    'firebrick3'],
    "\ ['darkgreen',   'RoyalBlue3'],
    "\ ['darkcyan',    'SeaGreen3'],
    "\ ['darkred',     'DarkOrchid3'],
    "\ ['red',         'firebrick3'],
    "\ ]

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces

" syntastic setting
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

" gruvbox opitons
set background=dark
let g:gruvbox_italic=0
colorscheme gruvbox

" solarized options 
"let g:solarized_termtrans=1
"let g:solarized_termcolors = 16
"let g:solarized_contrast = "high"
"let g:solarized_visibility = "high"
"set background=dark
"colorscheme solarized

" vim-airline setting
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
set backspace=2
let g:airline#extensions#branch#enabled = 1
let g:airline_theme = 'gruvbox'


" neocomplete setting
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
			\ 'default' : '',
			\ 'vimshell' : $HOME.'/.vimshell_hist',
			\ 'scheme' : $HOME.'/.gosh_completions'
			\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
	let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

" ctrlspace setting
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

" easytags setting
let g:easytags_auto_highlight = 0
let g:easytags_syntax_keyword = 'always'
let g:easytags_async = 1

" tagbar setting
nmap <F8> :TagbarToggle<CR>

" ctrp setting

" Dispatch setting
let g:dispatch_compilers = {
			\ 'fab': 'cpp',
			\}
nmap ,df :FocusDispatch 
nmap <silent> ,dp :Dispatch<cr>

function! QuickfixItemJump(direction, mode, count)
	norm! m'
	if a:mode ==# 'v'
		norm! gv
	endif
	let i = 0
	while i < a:count
		let i += 1
		let line = line('.')
		let col  = col('.')
		let pos = search('^[^|]\+', 'W'.a:direction)
		if pos == 0
			call cursor(line, col)
			return
		endif
	endwhile
endfunction
function! BufferNowaitMap()
	setl nowrap
	nnoremap <silent> <buffer> [[ :<C-U>call QuickfixItemJump('b', 'n', v:count1)<CR>
	nnoremap <silent> <buffer> ]] :<C-U>call QuickfixItemJump('' , 'n', v:count1)<CR>
	nmap <nowait> <buffer> <silent> q :q<cr>
endfunction
autocmd! BufReadPost quickfix call BufferNowaitMap()
autocmd! BufReadPost location call BufferNowaitMap()

autocmd! BufWritePost ~/.vimrc source ~/.vimrc
