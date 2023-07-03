vim.api.nvim_command('filetype plugin indent on')

vim.g.vimtex_view_method = "mupdf"
vim.g.vimtex_compiler_latexmk = { build_dir = 'build' }

local opts = 	{ noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
keymap("n", "<leader>tc", ":VimtexCompile<CR>", opts)
