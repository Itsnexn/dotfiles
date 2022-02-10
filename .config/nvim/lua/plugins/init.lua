-- =============================================
--          -== Packer Startup ==-
-- =============================================
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
	execute("packadd packer.nvim")
end

vim.cmd("autocmd BufWritePost init.lua PackerCompile")

return require("packer").startup(function(use)
	-- Packer {{
	use({ "wbthomason/packer.nvim" })
	-- }}
	-- Stuff {{
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "nvim-lua/plenary.nvim" })
	-- }}

	-- {{ LSP
	use({ "neovim/nvim-lspconfig" })
	use({ "williamboman/nvim-lsp-installer" })
	use({ "folke/lsp-colors.nvim" })
	use({ "onsails/lspkind-nvim" })
	use({ "L3MON4D3/LuaSnip" })
	use({ "tami5/lspsaga.nvim" })
	use({ "folke/trouble.nvim" })

	-- Code Formatting with lsp
	use("jose-elias-alvarez/null-ls.nvim")
	use("MunifTanjim/prettier.nvim")
	-- }}

	-- {{ CMP
	use({ "hrsh7th/nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lua" })
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "saadparwaiz1/cmp_luasnip" })
	-- }}

	-- {{ Buffers
	use({ "akinsho/bufferline.nvim" })
	use({ "Asheq/close-buffers.vim" })
	-- }}

	-- {{ Pairs
	use({ "windwp/nvim-autopairs" })
	use({ "andymass/vim-matchup" })
	-- }}

	-- UI {{
	use({ "folke/tokyonight.nvim", branch = "main" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "nvim-lualine/lualine.nvim" })
	use({ "norcalli/nvim-colorizer.lua" })
	use({ "glepnir/dashboard-nvim" })
	use({ "lukas-reineke/indent-blankline.nvim" })
	-- }}

	-- use {"github/copilot.vim"}

	-- {{ Other
	use({ "blackcauldron7/surround.nvim" }) -- Vim surround but in lua
	use({ "kyazdani42/nvim-tree.lua" }) -- File explorer/tree
	use({ "akinsho/toggleterm.nvim" }) -- Term
	use({ "tpope/vim-commentary" }) -- Comment stuff
	use({ "windwp/nvim-spectre" }) -- Find and Replace
	use({ -- Fuzzy Finder
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-symbols.nvim" }) -- Telescope emoji
	use({ -- Git Signs
		"lewis6991/gitsigns.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		-- tag = "release" -- To use the latest release
	})

	use({ -- Embed Neovim in browsers
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	use({ -- Better TODO comments for neovim
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	})

	use({ "ntpeters/vim-better-whitespace" }) -- highlight trailing whitespaces
	use({ "folke/which-key.nvim" }) -- Show Keyboard shortcuts
	use({ "vimwiki/vimwiki" }) -- Vim WIKI

	-- Distraction-free coding mode
	use({ "folke/zen-mode.nvim" })
	-- }}
end)
