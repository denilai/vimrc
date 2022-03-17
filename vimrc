"Incremental highlighted search
set incsearch
:set number

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END


set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
"set autoindent
"Auto indent. Apply top line indendtation
"set smartindent

colorscheme torte
set nocompatible
filetype off
set rtp+=/home/denilai/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'neocomplcache'
Plugin 'w0rp/ale'
Plugin 'bling/vim-airline'
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/syntastic'
Plugin 'dag/vim2hs'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'Shougo/vimproc'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l



nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

"" use ghc functionality for haskell files
"au Bufenter *.hs compiler ghc
"
"" switch on syntax highlighting
"syntax on
"
"" enable filetype detection, plus loading of filetype plugins
"filetype plugin on
"
"" configure browser for haskell_doc.vim
"let g:haddock_browser = "/usr/bin/yandex-browser"

" Set a vertical line for long line width. This will give us a visual
" indicator for cases in which line length is approaching 80 chars
"set colorcolumn=80
" Set the command section height to 2 lines.  Useful if notices (like syntastic) are shown on command lines
set cmdheight=2

let g:airline#extensions#ale#enabled = 1

nnoremap <Leader>ht :GhcModType<cr>
nnoremap <Leader>htc :GhcModTypeClear<cr>
autocmd FileType haskell nnoremap <buffer> <leader>? :call ale#cursor#ShowCursorDetail()<cr>
