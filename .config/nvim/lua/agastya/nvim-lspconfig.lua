local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

local set = vim.keymap.set

local on_attach = function()
    set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
    set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
    set("n", "gtd", vim.lsp.buf.type_definition, { buffer = 0 })
    set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
    set("n", "gr", vim.lsp.buf.references, { buffer = 0 })
    set("n", "<leader>dn", vim.diagnostic.goto_next, { buffer = 0 })
    set("n", "<leader>dN", vim.diagnostic.goto_prev, { buffer = 0 })
    set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
    set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = 0 })
    set("n", "<leader>fs", vim.lsp.buf.formatting_sync, { buffer = 0 })
end

-- LSP client settings

require("nvim-lsp-installer").setup {}

require("lspconfig").sumneko_lua.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").vimls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").clangd.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").pyright.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").texlab.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").ltex.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").tsserver.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").html.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
require("lspconfig").cssls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- Set up zk using zk-nvim (require("lspconfig") is NOT required in this case)
require("zk").setup({
  picker = "telescope",
  lsp = {
    -- `config` is passed to `vim.lsp.start_client(config)`
    config = {
      cmd = { "zk", "lsp" },
      name = "zk",
    },
    auto_attach = {
      enabled = true,
      filetypes = { "markdown" },
    },
  },
})

vim.keymap.set("n", "<leader>li", ":LspInfo<CR>")
