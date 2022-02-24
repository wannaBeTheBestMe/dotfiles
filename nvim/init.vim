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
set undodir=~/.cache/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode
set completeopt=menuone,noinsert,noselect
" set cursorline
set colorcolumn=80
set signcolumn=yes
set cmdheight=1
set updatetime=50
set shortmess+=c
set mouse=a
set guifont=Fira\ Code:h15
" set guifont=Fantasque\ Sans\ Mono:h9
" set guifont=SauceCodePro\ Nerd\ Font:h11
set autochdir
set guioptions+=a
set t_ut=""  " Otherwise colors don't load correctly in the terminal
syntax on

" Plugins
call plug#begin('~/.local/share/nvim/plugged/')
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
    " Plug 'lambdalisue/fern.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
    Plug 'tpope/vim-surround'
    " Plug 'tpope/vim-repeat'
    Plug 'vimwiki/vimwiki'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
    Plug 'tomtom/tlib_vim'
    Plug 'MarcWeber/vim-addon-mw-utils'
    " Plug 'garbas/vim-snipmate'
    " Plug 'Yggdroot/indentLine'
    Plug 'MaxMEllon/vim-jsx-pretty'
    Plug 'osyo-manga/vim-over'
    Plug 'ap/vim-css-color'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'vim-airline/vim-airline'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    Plug 'nvim-lua/completion-nvim'
    Plug 'turbio/bracey.vim'
    " Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
    Plug 'alvan/vim-closetag'
    Plug 'pangloss/vim-javascript' " ?
    Plug 'vim-scripts/loremipsum'
    Plug 'mattn/emmet-vim'
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/nvim-cmp'
    " For vsnip user.lua
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'liuchengxu/vim-which-key'
    " Plug 'sbdchd/neoformat' " ?

    Plug 'voldikss/vim-floaterm'
call plug#end()

" General Remappings
let mapleader = " "
inoremap ii <esc>
nnoremap Y y$
nnoremap <leader>fp :edit ~/.config/nvim/init.vim<cr>
nnoremap <leader>e :NERDTree .<cr>
nnoremap <f2> :source ~/.config/nvim/init.vim<cr>
nnoremap <f3> :PlugInstall<cr>
nnoremap <f4> :PlugClean<cr>
nnoremap <leader>bk :bdelete<cr>
nnoremap <leader>p "*p
nnoremap <c-b> :py3file %<cr>
" nnoremap gg=G gg=Gg;
" vnoremap <leader>p "_dP
nnoremap <leader>t :FloatermToggle!<cr>
inoremap <c-bs> <c-w>

" dashboard.vim Settings
let g:dashboard_default_executive ='telescope'
let g:indentLine_fileTypeExclude = ['text', 'dashboard', 'terminal']
" autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2

" vim-which-key Settings
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Colorscheme
set background=dark
colorscheme gruvbox

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <leader>dt :tab split<cr>

" Go to last active tab
au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>
vnoremap <silent> <c-l> :exe "tabn ".g:lasttab<cr>

" Emmet Settings
let g:user_emmet_mode="a"
let g:user_emmet_leader_key=","

" Airline Settings
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#formatter = "unique_tail_improved"
" let g:airline_left_sep='>'
" let g:airline_right_sep='<'
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

" Closing Tag Settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'
let g:closetag_filetypes = 'html,xhtml,phtml,js'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'
let g:closetag_emptyTags_caseSensitive = 0
" let g:closetag_regions = {
"     \ 'typescript.tsx': 'jsxRegion,tsxRegion',
"     \ 'javascript.jsx': 'jsxRegion',
"     \ 'typescriptreact': 'jsxRegion,tsxRegion',
"     \ 'javascriptreact': 'jsxRegion',
"     \ }
let g:closetag_shortcut = '>'
" let g:closetag_close_shortcut = '<leader>>'

" nvim-cmp Settings
set completeopt=menu,menuone,noselect

" Treesitter Settings
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF


lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
      ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      })
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
  })

  -- Setup lspconfig
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require'lspconfig'.cssls.setup{capabilities=capabilities}
  require'lspconfig'.cssls.setup{on_attach=require'completion'.on_attach}
  require'lspconfig'.html.setup{capabilities=capabilities}
  require'lspconfig'.html.setup{on_attach=require'completion'.on_attach}
  require'lspconfig'.lemminx.setup{}
  require'lspconfig'.lemminx.setup{on_attach=require'completion'.on_attach}
  require'lspconfig'.pyright.setup{}
  require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}
  require'lspconfig'.sumneko_lua.setup{}
  require'lspconfig'.sumneko_lua.setup{on_attach=require'completion'.on_attach}
  require'lspconfig'.texlab.setup{}
  require'lspconfig'.texlab.setup{on_attach=require'completion'.on_attach}
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.tsserver.setup{on_attach=require'completion'.on_attach}
  require'lspconfig'.vimls.setup{}
  require'lspconfig'.vimls.setup{on_attach=require'completion'.on_attach}
  require'lspconfig'.yamlls.setup{}
  require'lspconfig'.yamlls.setup{on_attach=require'completion'.on_attach}
EOF

" LSP Remappings
nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>
nnoremap <leader>vsd :lua vim.lsp.diagnostic.show_line_diagnostics(); vim.lsp.util.show_line_diagnostics()<CR>
nnoremap <leader>vn :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <leader>vll :call LspLocationList()<CR>

" NERDTree Settings
let NERDTreeShowHidden=1
" Remove the arrows, not required as the folder icon is present
let NERDTreeDirArrowExpandable = "\u00a0"
let NERDTreeDirArrowCollapsible = "\u00a0"

" Nvim-R Settings
nnoremap <leader>rf \rf
nnoremap <leader>rq \rq
nnoremap <leader>aa \ll
nnoremap <leader>bb \bb
nnoremap <leader>ff \ff
nnoremap <leader>ss \ss
nnoremap <leader>ll \ll

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

" " tab and s-tab
" function! InsertTabWrapper(direction)
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] !~ '\k'
"         return "\<tab>"
"     elseif "backward" == a:direction
"         return "\<c-p>"
"     else
"         return "\<c-n>"
"     endif
" endfunction
" inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
" inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

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
" let g:snipMate = { 'snippet_version' : 1 }

" indentLine Settings
let g:indentLine_setColors = 1
let g:indentLine_char = ''

" vim-latex Settings
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf'

autocmd TermOpen * setlocal nonumber norelativenumber

function! WC()
    let filename = expand("%")
    let cmd = "detex " . filename . " | wc -w | tr -d '[:space:]'"
    let result = system(cmd)
    echo result . " words"
endfunction

command WC call WC()

" Neovide Settings
let g:neovide_transparency=1
" let g:neovide_cursor_animation_length=0.03
let g:neovide_cursor_vfx_mode = "sonicboom"
