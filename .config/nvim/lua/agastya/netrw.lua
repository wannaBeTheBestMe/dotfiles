vim.g["netrw_keepdir"] = 0
vim.g["netrw_winsize"] = 30
vim.g["netrw_banner"] = 0
vim.g["netrw_localcopydircmd"] = "cp -r"
vim.cmd("hi! link netrwMarkFile Search")

local set = vim.keymap.set

set("n", "<leader>dd", "<cmd>Lexplore %:p:h<CR>")
set("n", "<leader>da", "<cmd>Lexplore<CR>")

function NetrwMapping()
  set("n", "H", "u", {buffer = 0, remap = true})
  set("n", "h", "-^", {buffer = 0, remap = true})
  set("n", "l", "<CR>", {buffer = 0, remap = true})

  set("n", ".", "gh", {buffer = 0, remap = true})
  set("n", "P", "<C-w>z", {buffer = 0, remap = true})

  set("n", "L", "<CR><cmd>Lexplore<CR>", {buffer = 0, remap = true})
  set("n", "<leader>dd", "<cmd>Lexplore<CR>", {buffer = 0, remap = true})
end

local augroup = vim.api.nvim_create_augroup("netrw_mapping", {clear = true})

vim.api.nvim_create_autocmd("filetype", {
    pattern = "netrw",
    group = augroup,
    callback = NetrwMapping,
})
