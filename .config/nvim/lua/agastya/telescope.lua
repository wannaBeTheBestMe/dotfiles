require("telescope").setup{}

local set = vim.keymap.set

-- File pickers
set("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
set("n", "<leader>lg", "<cmd>lua require('telescope.builtin').live_grep()<cr>")

-- NeoVim pickers
set("n", "<leader>bf", "<cmd>lua require('telescope.builtin').buffers()<cr>")
set("n", "<leader>ts", "<cmd>lua require('telescope.builtin').tags()<cr>")
set("n", "<leader>ht", "<cmd>lua require('telescope.builtin').help_tags()<cr>")
set("n", "<leader>fr", "<cmd>lua require('telescope.builtin').oldfiles()<cr>")
set("n", "<leader>mk", "<cmd>lua require('telescope.builtin').marks()<cr>")
set("n", "<leader>qf", "<cmd>lua require('telescope.builtin').quickfix()<cr>")
set("n", "<leader>ll", "<cmd>lua require('telescope.builtin').loclist()<cr>")
set("n", "<leader>jl", "<cmd>lua require('telescope.builtin').jumplist()<cr>")
set("n", "<leader>vo", "<cmd>lua require('telescope.builtin').vim_options()<cr>")
set("n", "<leader>ri", "<cmd>lua require('telescope.builtin').registers()<cr>")
set("n", "<leader>ss", "<cmd>lua require('telescope.builtin').spell_suggest()<cr>")
set("n", "<leader>km", "<cmd>lua require('telescope.builtin').keymaps()<cr>")
set("n", "<leader>ft", "<cmd>lua require('telescope.builtin').filetypes()<cr>")
set("n", "<leader>cbff", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>")
set("n", "<leader>ru", "<cmd>lua require('telescope.builtin').resume()<cr>")

-- LSP pickers
set("n", "<leader>lrr", "<cmd>lua require('telescope.builtin').lsp_references()<cr>")
set("n", "<leader>lds", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
set("n", "<leader>lws", "<cmd>lua require('telescope.builtin').lsp_workplace_symbols()<cr>")
set("n", "<leader>ldg", "<cmd>lua require('telescope.builtin').lsp_diagnostics()<cr>")
set("n", "<leader>lim", "<cmd>lua require('telescope.builtin').lsp_implementations()<cr>")
set("n", "<leader>ldf", "<cmd>lua require('telescope.builtin').lsp_definitions()<cr>")
set("n", "<leader>ltd", "<cmd>lua require('telescope.builtin').lsp_type_definitions()<cr>")

-- TODO: Git pickers

require("telescope").load_extension("fzy_native")

-- Personal shortcuts

set("n", "<leader>fp", "<cmd>Telescope find_files search_dirs=~/.config/nvim/<CR>")

-- project.nvim integration

require("telescope").load_extension("projects")

