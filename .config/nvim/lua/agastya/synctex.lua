function Synctex()
    vim.cmd("execute 'silent !zathura --synctex-forward ' . line('.') . ':' . col('.') . ':' . bufname('%') . ' ' . g:syncpdf")
    vim.cmd("redraw!")
end

vim.keymap.set({"n", "v", "s", "o"}, "<C-ENTER>", "<cmd>call Synctex()<CR>", {remap = true})
