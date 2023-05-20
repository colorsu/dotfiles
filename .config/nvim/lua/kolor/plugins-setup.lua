local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use ({"tzachar/local-highlight.nvim",
		config = function()
			require('local-highlight').setup()
		end
	})

	use("nvim-lua/popup.nvim")
	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use 'sainnhe/everforest'
	use("bluz71/vim-nightfly-guicolors")
	use("Mofiqul/vscode.nvim")
	use 'Mofiqul/dracula.nvim'

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window

	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	use "lukas-reineke/indent-blankline.nvim"
	use("tpope/vim-sleuth")

	-- commenting with gc
	use 'folke/todo-comments.nvim'
	use("numToStr/Comment.nvim")

	use("simrat39/rust-tools.nvim")

	-- file explorer
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons',
		},
		tag = 'nightly'
	}

	use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",  -- fuzzy finder
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
		config = function()
	require("telescope").load_extension("live_grep_args")
end
	})

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-nvim-lsp") -- for autocompletion
	use('hrsh7th/vim-vsnip')
	use('saadparwaiz1/cmp_luasnip')

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- useful snippets
	use("tpope/vim-fugitive")
	use("junegunn/gv.vim")

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require('lspsaga').setup({})
		end,
	})
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion
	use 'j-hui/fidget.nvim'

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- use("simrat39/symbols-outline.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use 'p00f/nvim-ts-rainbow'
	use 'xiyaowong/nvim-transparent'
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side
	use({"sindrets/diffview.nvim", requires = 'nvim-lua/plenary.nvim'})
	use("echasnovski/mini.trailspace")
	use {'ojroques/nvim-osc52'}
	use {
		'glepnir/dashboard-nvim',
		event = 'VimEnter',
		requires = {'nvim-tree/nvim-web-devicons'}
	}
	use 'kazhala/close-buffers.nvim'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		packer.sync()
	end
end)
