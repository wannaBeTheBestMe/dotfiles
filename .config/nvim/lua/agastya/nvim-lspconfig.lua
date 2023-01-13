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

require("nvim-lsp-installer").setup({
    ensure_installed = {"ltex", "html", "bashls", "ccls", "tsserver", "texlab", "pyright", "sumneko_lua", "clangd"}
})

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
-- require("lspconfig").ltex.setup {
--     capabilities = capabilities,
--     on_attach = on_attach,
-- }
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

vim.keymap.set("n", "<leader>li", ":LspInfo<CR>")
