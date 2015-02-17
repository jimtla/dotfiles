set shell=/bin/bash
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-abolish'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'wting/rust.vim'
Bundle 'dag/vim2hs'
Bundle 'fatih/vim-go'
Bundle 'Valloric/YouCompleteMe'
Bundle 'Raimondi/YAIFA'
Bundle 'mbbill/undotree'

filetype plugin indent on     " required!

set rtp+=$GOROOT/misc/vim

set guioptions=

syntax enable

if has('gui_running')
    set background=dark
    colorscheme solarized
endif

let g:SuperTabDefaultCompletionType = "context"
let g:syntastic_always_populate_loc_list=1

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

set number
set relativenumber

set colorcolumn=80

set incsearch
set smartcase
set ignorecase

set listchars=tab:·\ ,trail:·

let mapleader=" "
nnoremap <Leader>q :q<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :e
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>o :CtrlPBuffer<CR>
nnoremap <Leader>n :ll<CR>
nnoremap <Leader>m :lnext<CR>

" Vim!
nnoremap <Leader>gg :Ggrep -i ""<left>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>ga :Gwrite<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gd :Gdiff<cr>

nnoremap <leader>gtx ^yiw$a `xml:"pcrsA"`j  
nnoremap <leader>gtj ^yiw$a `json:"pcrsA"`j  


nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

autocmd QuickFixCmdPost *grep* cwindow

" Syntastic Stuff
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute "]
let g:pyflakes_use_quickfix = 0

" YAIFA Stuff
let g:yaifa_tab_width=4
let g:yaifa_indentation=0
autocmd BufReadPost * :silent !YAIFAMagic

" Go Stuff
au FileType go nmap <Leader>i <Plug>(go-import)
au FileType go nmap <Leader>d <Plug>(go-def)
au FileType go nmap <Leader>sd <Plug>(go-def-split)
au FileType go nmap <Leader>vd <Plug>(go-def-vertical)
let g:go_oracle_scope_file="jello/integrations/echub jello/sfe jello/vfe"
let g:go_fmt_command = "goimports"

nnoremap <Leader>qj ^yw$a `json:"phcrsA"`j

" Ctrl-P
let g:ctrlp_custom_ignore = 'js\/vendor\/dist'

" Easymotion
map <Leader> <Plug>(easymotion-prefix)
map b <Plug>(easymotion-s)
map / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
let g:EasyMotion_smartcase = 1
