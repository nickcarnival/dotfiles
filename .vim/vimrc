"
"we have to run the PluginInstall and qall now :(
"vim +PluginInstall +qall

set encoding=utf-8
set nocompatible
filetype off
   
" beginning of plug-vim stuff
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim'
Plug 'w0rp/ale'
Plug 'derekwyatt/vim-scala'
"Prettier
"Plug 'prettier/vim-prettier'
"Plug 'racer-rust/vim-racer'
Plug 'rust-lang/rust.vim'
Plug 'itchyny/lightline.vim'
call plug#end()            

" Put your non-Plugin stuff after this line
let g:deoplete#enable_at_startup = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '!!'
let g:ale_sign_warning = '--'
let g:prettier#config#single_quote = 'false'

"format files for windows
"set fileformat=dos
" neovim remap
tnoremap <Esc> <C-\><C-n>

"format files for unix
set fileformat=unix

"these three lines make tabs equal to four spaces
set tabstop=8
set softtabstop=8
set shiftwidth=8
set expandtab
"
"Changing how fast vim updates time, default is 4 seconds
set updatetime=100
"Enables GitGutter by default
let g:gitgutter_enabled = 1
"Disables the F1 key or the help key
:nmap <F1> <nop>
:imap <F1> <nop>

"Rust Mappings
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

"Shows colors and whatnot
syntax on
set t_co=256


"----------------------COLOR SCHEMES-------------------------
silent! colorscheme cobalt
silent! colorscheme moonfly
silent! colorscheme eddie
silent! colorscheme onehalfdark

"makes vim transparen
hi Normal guibg=NONE ctermbg=NONE
"This turns on relative numbers, your location=0 
set number relativenumber 

"This sets that bar on the right side of the screen
set colorcolumn=90


