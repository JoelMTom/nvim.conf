local options = {
	number = true,
	relativenumber = true,
	shiftwidth = 2,
	tabstop = 2,
	scrolloff = 8,
	sidescrolloff = 8,
	conceallevel = 0,
	hlsearch = false,
	incsearch = true,
	undofile = true,
	numberwidth = 4,
	updatetime = 50,
	clipboard = "unnamedplus",
	swapfile = false,
	termguicolors = true,
	signcolumn = "yes",
	--colorcolumn = "80",
	syntax = "enable"
}

for k, v in pairs(options) do
	vim.opt[k] = v
end
