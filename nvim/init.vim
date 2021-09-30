" Note: :read
" General Settings
set path+=**
" set wildmode=longest,list,full " Nice menu when typing `:find *.py`
set wildmenu
set exrc
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set ignorecase
set smartcase
set noswapfile
set nobackup
set undodir=C:\Users\LENOVO\AppData\nvim\Local\undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
" set cursorline
" set colorcolumn=80
" set signcolumn=yes
set cmdheight=1
set updatetime=50
set shortmess+=c
set mouse=a
set guifont=Roboto\ Mono:h11
set autochdir

" Plugins
call plug#begin('C:\Users\LENOVO\AppData\Local\nvim\plugged')
    Plug 'glepnir/dashboard-nvim'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'gruvbox-community/gruvbox'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'tyrannicaltoucan/vim-deep-space'
    Plug 'preservim/vim-pencil'
    " Plug 'lervag/vimtex'
    Plug 'vim-latex/vim-latex'
    " Plug 'kyazdani42/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons'
    Plug 'tpope/vim-commentary'
    Plug 'preservim/nerdtree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-repeat'
    Plug 'vimwiki/vimwiki'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'tomtom/tlib_vim'
    Plug 'MarcWeber/vim-addon-mw-utils'
    Plug 'garbas/vim-snipmate'
    Plug 'Yggdroot/indentLine'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'osyo-manga/vim-over'
    Plug 'ap/vim-css-color'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-airline/vim-airline'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'neovim/nvim-lspconfig'
    Plug 'kabouzeid/nvim-lspinstall'
    Plug 'nvim-lua/completion-nvim'
call plug#end()

" dashboard.vim Settings
let g:dashboard_default_executive ='telescope'
let g:indentLine_fileTypeExclude = ['text', 'dashboard', 'terminal']
" autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

" Colorscheme
colorscheme deep-space

" Remaps
let mapleader = " "
inoremap ii <esc>
nnoremap Y y$
nnoremap <leader>fp :edit C:\Users\LENOVO\AppData\Local\nvim\init.vim<cr>
nnoremap <leader>e :NERDTreeFind<cr>
nnoremap <f2> :source C:\Users\LENOVO\AppData\Local\nvim\init.vim<cr>
nnoremap <f3> :PlugInstall<cr>
nnoremap <f4> :PlugClean<cr>
nnoremap <leader>bk :bdelete<cr>
nnoremap <leader>p "*p
nnoremap <c-b> :py3file %<cr>
" vnoremap <leader>p "_dP

" Telescope
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<cr>
nnoremap <leader>ls <cmd>lua require('telescope.builtin').buffers()<cr><esc>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').marks()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').oldfiles()<cr>

" Autocomplete Menu and Other Menus
" C-j, C-k, Return
inoremap <expr><C-J> pumvisible() ? "\<C-n>" : "\<C-J>"
inoremap <expr><C-K> pumvisible() ? "\<C-p>" : "\<C-K>"
inoremap <expr><Cr>  pumvisible() ? "\<C-y>" : "\<Cr>"

" tab and s-tab
function! InsertTabWrapper(direction)
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    elseif "backward" == a:direction
        return "\<c-p>"
    else
        return "\<c-n>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

" LSP Settings
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.texlab.setup{}
require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}
EOF

" Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()

" Whitespace Stripping Settings
let g:better_whitespace_enabled=0
let g:strip_whitespace_on_save=1

" netrw Settings
"let g:netrw_banner=0
let g:netrw_altv=1 " Open splits to the right
let g:netrw_lifestyle=3 " Tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()

" set OverCommandLine

" vim-instant-markdown Settings
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

" Limelight Settings
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
let g:limelight_default_coefficient = 0.5
let g:limelight_paragraph_span = 0
" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'
" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

" SnipMate Settings
let g:snipMate = { 'snippet_version' : 1 }

" indentLine Settings
let g:indentLine_setColors = 1
let g:indentLine_char = '█'

" vim-latex Settings
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'

