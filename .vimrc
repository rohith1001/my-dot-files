set nocompatible              " be iMproved, required
set guifont=Ubuntu\ Mono\ Regular\ 17
set guioptions-=m
set guioptions-=T
set noeb vb t_vb=             " set visual bell, no error bell t_vb = nothing
"filetype off                  " required

set nobackup
set swapfile
set dir=~/tmp
set nowritebackup
set cursorline

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'jiangmiao/auto-pairs'

Plugin 'rhysd/vim-clang-format'

Plugin 'ycm-core/YouCompleteMe'

Plugin 'jacoborus/tender.vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" Removed plugin
" Plugin 'preservim/nerdtree'

filetype plugin indent on    " required
syntax enable
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
"
" An example for a vimrc file.
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings, bail
" out.

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
    set termguicolors
endif

if v:progname =~? "evim"
    finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
    set nobackup	" do not keep a backup file, use versions instead
else
    set backup	" keep a backup file (restore to previous version)
    if has('persistent_undo')
        set undofile	" keep an undo file (undo changes after closing)
    endif
endif

if &t_Co > 2 || has("gui_running")
    " Switch on highlighting the last used search pattern.
    set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
    packadd! matchit
endif

set relativenumber number

set tabstop=4 shiftwidth=4 expandtab

set hlsearch incsearch

set conceallevel=0
hi link HelpBar Normal
hi link HelpBar Normal

vnoremap <C-c> "+y
nnoremap gcp "+p

" normal mode: save
nnoremap <c-s> :w!<CR>

" insert mode: escape to normal, save and enter insert mode
inoremap <c-s> <Esc>:w!<CR>a

" normal mode: quit
nnoremap <c-q> :wq!<CR>

" insert mode: escape to normal, save and quit
inoremap <c-q> <Esc>:wq!<CR>

" visual mode: escape to normal, save and quit
vnoremap <c-q> <Esc>:wq!<CR>

" normal mode: exit
nnoremap <c-e> :q<CR>

" insert mode: exit
inoremap <c-e> <Esc>:q<CR>

" visual mode: exit
vnoremap <c-e> <Esc>:q<CR>

" insert mode: escape to normal mode, move 1 char and enter insert mode
inoremap <c-l> <Esc>la

" normal mode: indent
nnoremap <c-i> gg=G

set background=dark
colorscheme tender
" autocmd vimenter * colorscheme tender

let g:airline_theme = 'light'
" let g:gruvbox_contrast_dark='hard'

vnoremap <C-c> "+y

" open nerd tree automatically when vim starts up
" autocmd vimenter * NERDTree

" open nerd tree automatically even when no file was specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" open nerd tree when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" map nerd tree to Ctrl-n
" map <C-n> :NERDTreeToggle<CR>

" show hidden files in nerd tree
" let NERDTreeShowHidden=1

" let NERDTreeMinimalUI = 1
" let NERDTreeDirArrows = 1

" some airline stuff
" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Cursor shape!!!!
if has("autocmd")
    au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
    au InsertEnter,InsertChange *
                \ if v:insertmode == 'i' |
                \   silent execute '!echo -ne "\e[5 q"' | redraw! |
                \ elseif v:insertmode == 'r' |
                \   silent execute '!echo -ne "\e[3 q"' | redraw! |
                \ endif
    au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

" load a template for a specific file
autocmd BufNewFile  *.cpp	0r ~/vim/skeleton.cpp
