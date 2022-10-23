vim.g["vimtex_view_method"] = "zathura"
vim.g["vimtex_compiler_method"] = "latexmk"
vim.g["maplocalleader"] = ","

vim.cmd([[
call vimtex#imaps#add_map({
      \ 'lhs' : '<M-i>',
      \ 'rhs' : '\item ',
      \ 'leader'  : '',
      \ 'wrapper' : 'vimtex#imaps#wrap_trivial'
      \})
]])
