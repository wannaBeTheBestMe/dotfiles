require('impatient')
require("agastya.options")
require("agastya.mappings")
require("agastya.plugins")
require("agastya.colorscheme")
require("agastya.lualine")
require("agastya.nvim-cmp")
require("agastya.nvim-lspconfig")
require("agastya.zk-nvim")
require("agastya.dap")
require("agastya.nvim-treesitter")
require("agastya.netrw")
require("agastya.synctex")
require("agastya.comment")
require("agastya.nvim-web-devicons")
require("agastya.project")
require("agastya.telescope")
require("agastya.nvim-autopairs")
require("agastya.vimtex")
require("agastya.nvim-tree")
require("agastya.which-key")
-- require("agastya.dashboard-nvim")
-- TODO: Investigate mbbill/undotree

vim.cmd("autocmd TermOpen * setlocal nonumber norelativenumber")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function()
       vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end
})
