local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if(fn.empty(fn.glob(install_path)) > 0) then
		fn.system({
			"git",
			"clone",
			"--depth",
			"1",
			"https://github.com/wbthomason/packer.nvim",
			install_path
		})
		print("Installing Packer")
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()


vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile 
autocmd BufWritePost plugins.lua source <afile> | PackerSync 
augroup end
]])


local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end
	},
})

return packer.startup(function(use)
	use "wbthomason/packer.nvim"
	use "lervag/vimtex"
	use {
		"nvim-telescope/telescope.nvim", tag = "0.1.1",
		requires = { {"nvim-lua/plenary.nvim"} }
	}
	use { "folke/tokyonight.nvim" }
	use("nvim-treesitter/nvim-treesitter", {run =  ":TSUpdate"})
	use("mbbill/undotree")
	use{"VonHeikemen/lsp-zero.nvim", branch = "v2.x",
		requires = { 
			{"neovim/nvim-lspconfig"},
			{"williamboman/mason.nvim",
			build = function()
				pcall(vim.cmd, "MasonUpdate")
			end},
			{"williamboman/mason-lspconfig.nvim"},
			{"hrsh7th/nvim-cmp"},     -- Required
			{"hrsh7th/cmp-nvim-lsp"}, -- Required
			{"L3MON4D3/LuaSnip"},
		}
	}
	use "nvim-tree/nvim-web-devicons"
	use "lukas-reineke/indent-blankline.nvim"
	use "preservim/nerdtree"
	use "markonm/traces.vim"
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()

	end}
if packer_bootstrap then
	packer.sync()
end

end)

