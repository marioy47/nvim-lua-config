-- lua/plugins.lua

-- Place where packer is goint to be saved
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Install packer from github if is not in our system
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected require call (pcall) so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Show packer messages in a popup. Looks cooler
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Alt installation of packer without a function
packer.reset()
local use = packer.use

--[[
  Start adding plugins here
]]
use({ -- Have packer manage itself
	"wbthomason/packer.nvim",
})
use({ -- A collection of material based themes.
	"marko-cerovac/material.nvim",
})
use({ -- Port of VSCode's Tokio Night theme
	"folke/tokyonight.nvim",
})
use({ -- Adaptation of the Sublime Text theme for vim.
	"adrian5/oceanic-next-vim",
})
use({ -- Another cool dark theme
	"EdenEast/nightfox.nvim",
	config = function()
		require("config.nightfox")
	end,
})
use({
	"projekt0n/github-nvim-theme",
})
use({ -- Install and configure treesitter languages
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = function()
		require("config.treesitter")
	end,
})
use({ -- Configure LSP client and Use an LSP server installer.
	"neovim/nvim-lspconfig",
	requires = {
		"williamboman/nvim-lsp-installer", -- Installs servers within neovim
		"onsails/lspkind-nvim", -- adds vscode-like pictograms to neovim built-in lsp
		"b0o/schemastore.nvim", -- Auto validation some json files like package.json or .esltitrc.json
	},
	config = function()
		require("config.lsp")
	end,
})
use({ -- Completion engine
	"hrsh7th/nvim-cmp",
	requires = {
		"onsails/lspkind-nvim", -- Icons on the popups
		"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
		"saadparwaiz1/cmp_luasnip", -- Snippets source
		"L3MON4D3/LuaSnip", -- Snippet engine
	},
	config = function()
		require("config.cmp")
	end,
})
use({
	"jose-elias-alvarez/null-ls.nvim",
	requires = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		require("config.null-ls")
	end,
})
use({
	"gpanders/editorconfig.nvim",
})
-- Lua
use({
	"folke/trouble.nvim",
	requires = "kyazdani42/nvim-web-devicons",
	config = function()
		require("trouble").setup({})
	end,
})
use({
	"nvim-telescope/telescope.nvim",
	requires = { { "nvim-lua/plenary.nvim" } },
	config = function()
    require('config.telescope')
	end,
})

--[[
use({ -- Find files, buffers, keys, etc with :Telescope <command>
  "nvim-telescope/telescope.nvim",
  requires = {
    "nvim-lua/plenary.nvim",
    { "kyazdani42/nvim-web-devicons", opt = true },
    "nvim-telescope/telescope-frecency.nvim", -- Better sorting algorithm
    "tami5/sqlite.lua", -- required by fequency
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-packer.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    -- 'nvim-telescope/telescope-fzf-native.nvim', -- Better file search
  },
  config = function()
    require("config.telescope")
  end,
})
use({
  "kyazdani42/nvim-tree.lua",
  requires = {
    "kyazdani42/nvim-web-devicons", -- optional, for file icon
  },
  config = function()
    require("config.nvim-tree")
  end,
})
use({
  "TimUntersberger/neogit",
  requires = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
  },
  config = function()
    require("neogit").setup({
      integrations = {
        diffview = true,
      },
    })
  end,
})
use({
  "f-person/git-blame.nvim",
  config = function()
    vim.g.gitblame_enabled = 1
  end,
})
use({ -- Use FZF for faster file search (didn't work as telescope requierement).
  "nvim-telescope/telescope-fzf-native.nvim",
  requires = {
    "nvim-telescope/telescope.nvim",
  },
  run = "make",
  config = function()
    require("telescope").load_extension("fzf")
  end,
})
use({ -- Add indentation guides even on blank lines
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    vim.g.indent_blankline_char = "┊"
    vim.g.indent_blankline_filetype_exclude = { "help", "packer" }
    vim.g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
    vim.g.indent_blankline_show_trailing_blankline_indent = false
  end,
})
use({ -- Make the status line beautiful
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = function()
    require("config.lualine")
  end,
})

--]]

use({
	"folke/which-key.nvim",
	config = function()
		require("config.which-key")
	end,
})
use({ -- Fast commenting! Enable gcc and gcb for comments
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
	end,
})
use({
	"kg8m/vim-simple-align",
})
use({ -- Preview current markdown file with :MarkdownPreview
	"iamcco/markdown-preview.nvim",
	run = "cd app && npm install",
	ft = { "markdown" },
	cmd = { "MarkdownPreview", "MarkdownPreviewToggle" }, -- Load on this commands
})

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
	require("packer").sync()
end

-- vim: ts=2 sw=2 et
