set number
set relativenumber
set ruler
set cmdheight=1
syntax enable
set nocompatible
filetype plugin indent on
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set smartindent
set cursorline
highlight CursorLine ctermbg=black ctermfg=none cterm=bold cterm=italic
highlight CursorLineNR cterm=bold ctermfg=white
let mapleader = " "
nmap <leader>cd :Ex<cr>
nmap <leader>s :w<cr>
nmap <leader>q :q!<cr>
