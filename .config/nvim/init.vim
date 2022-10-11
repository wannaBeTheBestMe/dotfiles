lua <<EOF
-- General settings

vim.opt.path:append("**")
vim.opt.wildmode = {"longest", "list", "full"}
vim.opt.wildmenu = true
vim.opt.exrc = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hlsearch = false
vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/undodir"
vim.opt.undofile = true
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.completeopt = {"menu", "menuone", "noinsert", "noselect"}
vim.opt.colorcolumn = "80"
vim.opt.signcolumn = "auto"
vim.opt.cmdheight = 1
vim.opt.updatetime = 50
vim.opt.shortmess:append("c")
vim.opt.mouse = "a"
vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h9"
-- vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h12"
-- vim.opt.guifont = "ComicMono Nerd Font"
vim.opt.autochdir = true
vim.opt.nrformats:append("alpha")
vim.opt.background = "dark"
vim.opt.dictionary = "spell"
vim.opt.sidescrolloff = 8
vim.opt.laststatus = 3

-- General mappings
vim.g["mapleader"] = " "

vim.keymap.set("i", "ii", "<ESC>")
vim.keymap.set("n", "Y", "y$<CR>")

vim.keymap.set("n", "<leader>fp", "<cmd>edit ~/.config/nvim/init.vim<CR>")
vim.keymap.set("n", "<F2>", "<cmd>source ~/.config/nvim/init.vim<CR>")

vim.keymap.set("n", "<F3>", ":PlugInstall<CR>")
vim.keymap.set("n", "<F4>", ":PlugClean<CR>")
vim.keymap.set("n", "<leader>bp", ":bprevious<CR>")
vim.keymap.set("n", "<leader>bn", ":bnext<CR>")
vim.keymap.set("n", "<leader>bd", ":bdelete<CR>")
vim.keymap.set("n", "<leader>p", '"+p')
-- vim.keymap.set("i", "<c-<bs>>", "<c-w>")

-- Go to tab by number
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")
vim.keymap.set("n", "<leader>4", "4gt")
vim.keymap.set("n", "<leader>5", "5gt")
vim.keymap.set("n", "<leader>6", "6gt")
vim.keymap.set("n", "<leader>7", "7gt")
vim.keymap.set("n", "<leader>8", "8gt")
vim.keymap.set("n", "<leader>9", "9gt")
vim.keymap.set("n", "<leader>0", "<cmd>tablast<CR>")
vim.keymap.set("n", "<leader>dt", "<cmd>tab split<CR>")

vim.keymap.set("n", "<C-w><C-t>", "<C-w>TgT<cmd>q<CR>")

vim.keymap.set("t", "<esc>", "<C-\\><C-n>")
vim.keymap.set("t", "<C-w>", "<c-\\><c-n><c-w>")
vim.keymap.set("t", "<C-w>", "<c-\\><c-n><c-w>")
vim.keymap.set("t", "<C-w>", "<c-\\><c-n><c-w>")
vim.keymap.set("t", "<C-w>", "<c-\\><c-n><c-w>")

vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

vim.cmd("inoremap <expr><c-j> pumvisible() ? '\\<c-n>' : '\\<c-j>'")
vim.cmd("inoremap <expr><c-k> pumvisible() ? '\\c-p>' : '\\<c-k>'")
-- vim.cmd("inoremap <expr><c-j> pumvisible() ? '\\<c-y>' : '\\<CR>'")

EOF

call plug#begin()
    " LSP support
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
    " Plug 'jose-elias-alvarez/null-ls.nvim'

    " DAP support
    Plug 'mfussenegger/nvim-dap'
    Plug 'rcarriga/nvim-dap-ui'
    Plug 'nvim-telescope/telescope-dap.nvim'
    Plug 'theHamsta/nvim-dap-virtual-text'

    " Completion
    Plug 'nvim-lua/plenary.nvim'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
    Plug 'hrsh7th/nvim-cmp'

    " Better language support
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'lervag/vimtex'
    Plug 'mattn/emmet-vim'
    Plug 'ap/vim-css-color'

    " Quality of life improvements
    " Plug 'vim-airline/vim-airline'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'tpope/vim-surround'
    Plug 'numToStr/Comment.nvim'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'easymotion/vim-easymotion'
    Plug 'onsails/lspkind.nvim'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'morhetz/gruvbox'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'VebbNix/lf-vim'
    Plug 'windwp/nvim-autopairs'

    " Better tooling
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'nvim-telescope/telescope-fzy-native.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'mickael-menu/zk-nvim'
    Plug 'preservim/vim-pencil'
call plug#end()

lua <<EOF

-- Colorscheme settings

vim.cmd("colorscheme tokyonight")
vim.g.tokyonight_style = "storm"

require("lualine").setup()

-- nvim-cmp settings

local cmp = require("cmp")
local lspkind = require("lspkind")

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format({
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                path = "[path]",
                luasnip = "[snip]",
            },
        }),
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lsp_signature_help" },
    }, {
        { name = "buffer", keyword_length = 5 },
    }),
    experimental = {
        ghost_text = true,
    },
})

cmp.setup.filetype("gitcommit", {
    sources = cmp.config.sources({
        { name = "cmp_git" },
    }, {
        { name = "buffer", keyword_length = 5 },
    })
})

cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = "buffer", keyword_length = 5 }
    }
})

cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = "path" }
    }, {
        { name = "cmdline", keyword_length = 5 }
    })
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local on_attach = function()
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = 0})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    vim.keymap.set("n", "gtd", vim.lsp.buf.type_definition, {buffer = 0})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {buffer = 0})
    vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, {buffer = 0})
    vim.keymap.set("n", "<leader>dN", vim.diagnostic.goto_prev, {buffer = 0})
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {buffer = 0})
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {buffer = 0})
    vim.keymap.set("n", "<leader>fs", vim.lsp.buf.formatting_sync, {buffer = 0})
end

-- LSP client settings

    require("nvim-lsp-installer").setup{}

    require("lspconfig").sumneko_lua.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require("lspconfig").vimls.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require("lspconfig").clangd.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require("lspconfig").pyright.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require("lspconfig").texlab.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require("lspconfig").ltex.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require("lspconfig").tsserver.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require("lspconfig").html.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    require("lspconfig").cssls.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    }
    --[[ require("lspconfig").zk.setup{
        capabilities = capabilities,
        on_attach = on_attach,
    } ]]
    require("zk").setup() -- Set up zk using zk-nvim

vim.keymap.set("n", "<leader>li", ":LspInfo<CR>")

-- DAP settings

local dap = require("dap")

dap.adapters.python = {
    type = "executable";
    command = "/usr/bin/python";
    args = { "-m", "debugpy.adapter" };
}

dap.configurations.python = {
    {
        type = "python";
        request = "launch";
        name = "Launch file";
        program = "${file}";
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                return cwd .. '/venv/bin/python'
            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                return cwd .. '/.venv/bin/python'
            else
                return '/usr/bin/python'
            end
        end;
    },
}

dap.defaults.fallback.external_terminal = {
    command = "/usr/bin/alacritty";
    args = {"-e"};
}
-- dap.defaults.fallback.force_external_terminal = true
-- dap.defaults.fallback.terminal_win_cmd = "50vsplit new"
dap.defaults.fallback.focus_terminal = true

-- nvim-dap includes an omnifunc implementation which uses the active debug
-- session to get completion candidates.
vim.cmd("au FileType dap-repl python require('dap.ext.autocompl').attach()")

vim.keymap.set("n", "<F5>", "<cmd>lua require('dap').continue()<CR>")
vim.keymap.set("n", "<F10>", "<cmd>lua require('dap').step_over()<CR>")
vim.keymap.set("n", "<F11>", "<cmd>lua require('dap').step_into()<CR>")
vim.keymap.set("n", "<F12>", "<cmd>lua require('dap').step_out()<CR>")
vim.keymap.set("n", "<leader>br", "<cmd>lua require('dap').toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>Br", "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<leader>lp", "<cmd>lua require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require('dap').repl.open()<CR>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require('dap').run_last()<CR>")

-- nvim-dap-ui settings

require("dapui").setup()

local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

-- nvim-dap-virtual-text settings

require("nvim-dap-virtual-text").setup()

-- nvim-treesitter settings

require'nvim-treesitter.configs'.setup {
    ensure_installed = "all",
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = {".vim"},
    },
    indent = {
        enable = true
    },
    autotag = {
        enable = true,
    }
}

-- netrw settings

vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.g["netrw_keepdir"] = 0
vim.g["netrw_winsize"] = 30
vim.g["netrw_banner"] = 0
vim.g["netrw_localcopydircmd"] = "cp -r"
vim.cmd("hi! link netrwMarkFile Search")

vim.keymap.set("n", "<leader>dd", "<cmd>Lexplore %:p:h<CR>")
vim.keymap.set("n", "<leader>da", "<cmd>Lexplore<CR>")

function NetrwMapping()
  vim.keymap.set("n", "H", "u", {buffer = 0, remap = true})
  vim.keymap.set("n", "h", "-^", {buffer = 0, remap = true})
  vim.keymap.set("n", "l", "<CR>", {buffer = 0, remap = true})

  vim.keymap.set("n", ".", "gh", {buffer = 0, remap = true})
  vim.keymap.set("n", "P", "<C-w>z", {buffer = 0, remap = true})

  vim.keymap.set("n", "L", "<CR><cmd>Lexplore<CR>", {buffer = 0, remap = true})
  vim.keymap.set("n", "<leader>dd", "<cmd>Lexplore<CR>", {buffer = 0, remap = true})
end

local augroup = vim.api.nvim_create_augroup("netrw_mapping", {clear = true})

vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    group = augroup,
    callback = NetrwMapping,
})

-- Synctex

function Synctex()
    vim.cmd("execute 'silent !zathura --synctex-forward ' . line('.') . ':' . col('.') . ':' . bufname('%') . ' ' . g:syncpdf")
    vim.cmd("redraw!")
end

vim.keymap.set({"n", "v", "s", "o"}, "<C-ENTER>", "<cmd>call Synctex()<CR>", {remap = true})
    
-- Comment.nvim settings

require("Comment").setup({ mappings = {
    basic = true,
    extra = true,
    extended = true
    },
})

-- nvim-web-devicons settings

require("nvim-web-devicons").setup {
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 default = true;
}

-- telescope.nvim settings

require("telescope").setup{}

-- File pickers
vim.keymap.set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
vim.keymap.set("n", "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")

-- NeoVim pickers
vim.keymap.set("n", "<leader>bf", "<cmd>lua require('telescope.builtin').buffers()<cr>")
vim.keymap.set("n", "<leader>ts", "<cmd>lua require('telescope.builtin').tags()<cr>")
vim.keymap.set("n", "<leader>ht", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
vim.keymap.set("n", "<leader>of", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
vim.keymap.set("n", "<leader>mk", "<cmd>lua require('telescope.builtin').marks()<cr>")
vim.keymap.set("n", "<leader>qf", "<cmd>lua require('telescope.builtin').quickfix()<cr>")
vim.keymap.set("n", "<leader>ll", "<cmd>lua require('telescope.builtin').loclist()<cr>")
vim.keymap.set("n", "<leader>jl", "<cmd>lua require('telescope.builtin').jumplist()<cr>")
vim.keymap.set("n", "<leader>vo", "<cmd>lua require('telescope.builtin').vim_options()<cr>")
vim.keymap.set("n", "<leader>ri", "<cmd>lua require('telescope.builtin').registers()<cr>")
vim.keymap.set("n", "<leader>ss", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>")
vim.keymap.set("n", "<leader>km", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>lua require('telescope.builtin').filetypes()<cr>")
vim.keymap.set("n", "<leader>cbff", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
vim.keymap.set("n", "<leader>ru", "<cmd>lua require('telescope.builtin').resume()<cr>")

-- LSP pickers
vim.keymap.set("n", "<leader>lrr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
vim.keymap.set("n", "<leader>lds", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
vim.keymap.set("n", "<leader>lws", "<cmd>lua require('telescope.builtin').lsp_workplace_symbols()<cr>")
vim.keymap.set("n", "<leader>ldg", "<cmd>lua require('telescope.builtin').lsp_diagnostics()<cr>")
vim.keymap.set("n", "<leader>lim", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
vim.keymap.set("n", "<leader>ldf", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
vim.keymap.set("n", "<leader>ltd", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>")

-- TODO: Git pickers

-- telescope-fzy-native settings

require("telescope").load_extension("fzy_native")

-- autopairs settings

require("nvim-autopairs").setup{}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
-- local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

-- vimtex settings

vim.g["vimtex_view_method"] = "zathura"
vim.g["vimtex_compiler_method"] = "latexmk"
vim.g["maplocalleader"] = ","

EOF

call vimtex#imaps#add_map({
      \ 'lhs' : '<M-i>',
      \ 'rhs' : '\item ',
      \ 'leader'  : '',
      \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
      \})
