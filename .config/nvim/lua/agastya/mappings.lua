-- General

vim.g.mapleader = " "
vim.g.maplocalleader = ","

local set = vim.keymap.set

set("i", "ii", "<ESC>")
set("n", "Y", "y$<CR>")

-- Plugins
set("n", "<F2>", "<cmd>luafile %<CR>")
set("n", "<F3>", "<cmd>PackerCompile<CR><cmd>PackerInstall<CR>")
set("n", "<F4>", "<cmd>PackerClean<CR>")

-- Clipboard
-- set("n", "<leader>y", '"+y')
-- set("n", "<leader>p", '"+p')

-- Buffers
set("n", "<leader>bp", "<cmd>bprevious<CR>")
set("n", "<leader>bn", "<cmd>bnext<CR>")
set("n", "<leader>bd", "<cmd>bdelete<CR>")
set("n", "<leader>bD", "<cmd>bdelete!<CR>")

-- Windows
set("n", "<leader>ww", "<c-w>w")
set("n", "<leader>ws", "<c-w>s")
set("n", "<leader>wv", "<c-w>v")
set("n", "<leader>wR", "<c-w>R")
set("n", "<leader>wq", "<c-w>q")
set("n", "<leader>wH", "<c-w>H")
set("n", "<leader>wL", "<c-w>L")
set("n", "<leader>wJ", "<c-w>J")
set("n", "<leader>wK", "<c-w>K")

-- set("i", "<c-<bs>>", "<c-w>")

-- Tabs
set("n", "<leader>1", "1gt")
set("n", "<leader>2", "2gt")
set("n", "<leader>3", "3gt")
set("n", "<leader>4", "4gt")
set("n", "<leader>5", "5gt")
set("n", "<leader>6", "6gt")
set("n", "<leader>7", "7gt")
set("n", "<leader>8", "8gt")
set("n", "<leader>9", "9gt")
set("n", "<leader>0", "<cmd>tablast<CR>")
set("n", "<leader>dt", "<cmd>tab split<CR>")
set("n", "<C-w><C-t>", "<C-w>TgT<cmd>q<CR>")

-- Terminal
set("t", "<esc>", "<C-\\><C-n>")
set("t", "<C-w>", "<c-\\><c-n><c-w>")
set("t", "<C-w>", "<c-\\><c-n><c-w>")
set("t", "<C-w>", "<c-\\><c-n><c-w>")
set("t", "<C-w>", "<c-\\><c-n><c-w>")

-- Misc
-- vim.cmd("inoremap <expr><c-j> pumvisible() ? '\\<c-n>' : '\\<c-j>'")
-- vim.cmd("inoremap <expr><c-k> pumvisible() ? '\\c-p>' : '\\<c-k>'")
-- vim.cmd("inoremap <expr><c-j> pumvisible() ? '\\<c-y>' : '\\<CR>'")
