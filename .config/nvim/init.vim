set nocompatible
syntax on
set number relativenumber

filetype plugin indent on

"set cursorline
set showcmd
set showmode
set showmatch

set incsearch
set ignorecase

set scrolloff=10
set matchpairs+=<:> " use % to jump between pairs
set listchars=tab:▸\ ,eol:¬
set ttyfast

set nobackup
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set copyindent
set expandtab

set ruler

set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"hi CursorLine cterm=NONE ctermbg=180


call plug#begin()
"Plug 'ycm-core/YouCompleteMe'
"Plug 'neoclide/coc.nvim'
    " Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

    " Utilities
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'ap/vim-css-color'
Plug 'preservim/nerdtree'

Plug 'folke/tokyonight.nvim'
Plug 'tribela/vim-transparent'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-neorg/neorg' | Plug 'nvim-lua/plenary.nvim'
call plug#end()

let g:airline_theme='base16_dracula'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let NERDTreeShowHidden=1

set t_Co=256
set background=dark

colorscheme tokyonight-night

nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :sp<CR>:terminal<CR>
nnoremap <F4> :bd<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"nnoremap <C-H> <C-w>H
"nnoremap <C-J> <C-w>J
"nnoremap <C-K> <C-w>K
"nnoremap <C-L> <C-w>L

nnoremap <A-h> <C-w><
nnoremap <A-l> <C-w>>
nnoremap <A-j> <C-w>-
nnoremap <A-k> <C-w>+

nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bprev<CR>

"nnoremap <F3> <C-|>&&<C-n>
"hi Normal guibg=NONE ctermbg=NONE


lua << EOF
require('neorg').setup {
    load = {
        load = all_of_the_stuff,
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
    },
}
EOF
