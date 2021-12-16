" ==========================================
" lgrabinski@gmail.com
" https://github.com/lgrabinski/dotfiles.git
" ==========================================

set nocompatible

set number                  " line numbers
set relativenumber				  " relative line numbers
syntax on				          	" enables syntax highlights

set ignorecase					    " ingores case when searching

set complete+=kspell				" auto complete with spellcheck
set completeopt=menuone     " auto complete with menu

set scrolloff=8					    " Better scrolling

set mouse=nv

call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'dylanaraps/wal.vim'
Plug 'ap/vim-css-color'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim',{'ac':'dracula'}
Plug 'sheerun/vim-polyglot'
" Plug 'kristijanhusak/orgmode.nvim'
Plug 'nvim-neorg/neorg'
Plug 'nekonako/xresources-nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'liuchengxu/vim-clap'
Plug 'romgrk/doom-one.vim'
Plug 'mcchrish/nnn.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
Plug 'tc50cal/vim-terminal'
Plug 'preservim/tagbar'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" Defaul value is clap for dashboard
"let g:dashboard_default_executive = 'clap'
let g:dashboard_default_executive = 'telescope'

"let g:doom_one_terminal_colors = v:true

"colorscheme doom-one 
"colorscheme xresources
colorscheme wal

" airline related
let g:airline_powerline_fonts = 1
set t_Co=256


" ==================
" Default Key update
" ==================
" Map the leader key to SPACE (SPC)
let mapleader="\<SPACE>"
"map <leader>ff :Telescope fine_files<CR>
nnoremap <silent> <leader>ff :Telescope find_files<CR>
nnoremap <silent> <leader>fr :Telescope oldfiles<CR>
