-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- empty setup using defaults
require("nvim-tree").setup({
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_root = true
  },
})

vim.keymap.set("n", "<leader>op", "<cmd>NvimTreeToggle<cr>")
vim.keymap.set("n", "<leader>oP", "<cmd>NvimTreeFindFileToggle<cr>")
