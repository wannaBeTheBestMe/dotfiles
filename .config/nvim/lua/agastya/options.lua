-- General

local opt = vim.opt

opt.path:append("**")
opt.wildmode = {"longest", "list", "full"}
opt.wildmenu = true
opt.exrc = true
opt.relativenumber = true
opt.number = true
opt.hlsearch = false
opt.hidden = true
opt.errorbells = false
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.ignorecase = true
opt.smartcase = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.cache/undodir"
opt.undofile = true
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.showmode = false
opt.completeopt = {"menu", "menuone", "noinsert", "noselect"}
opt.colorcolumn = "80"
opt.signcolumn = "auto"
opt.cmdheight = 1
opt.updatetime = 50
opt.shortmess:append("c")
opt.mouse = "a"
opt.guifont = "Liga SFMono Nerd Font:h14"
-- opt.guifont = "JetBrainsMono Nerd Font Mono:h12"
opt.autochdir = true
opt.nrformats:append("alpha")
opt.background = "dark"
opt.dictionary = "spell"
opt.sidescrolloff = 8
-- opt.laststatus = 3
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.timeoutlen = 500
