-- plugins.lua

-- Place where packer is goint to be saved
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- Install packer from github if is not in our system
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected require call (pcall) so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Show packer messages in a popup
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Alt installation of packer without a function
packer.reset()
local use = packer.use

--[[
  Start adding plugins here
]]
use {-- Have packer manage itself
  "wbthomason/packer.nvim",
}
use { -- A collection of themes: palenight, oceanic, deep ocean, darker, ligher
  'marko-cerovac/material.nvim',
  config = function()
    vim.g.material_style = "deep ocean"
  end
}
use {-- Port of VSCode's Tokio Night theme
  "folke/tokyonight.nvim",
  config = function()
    vim.g.tokyonight_style = "light"
  end
}
use {-- Adaptation of the Sublime Text theme for vim.
  "adrian5/oceanic-next-vim",
  config = function()
    vim.g.oceanic_transparent_bg = 1
    vim.g.oceanic_italic_comments = 1
  end
}
use {
  'EdenEast/nightfox.nvim',
}
use {-- Fast commenting! Enable gcc and gcb for comments
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}
use { -- Configure LSP client and Use an LSP server installer.
    'neovim/nvim-lspconfig',
    requires = {
      'williamboman/nvim-lsp-installer',
    },
    config = function()
      require('config.lsp')
    end
}
use { -- Completion engine
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp', -- Queries the LSP for completions
    'hrsh7th/cmp-buffer', -- Complete things for the current buffer
    'hrsh7th/cmp-path', -- Complete filenames and paths
    'hrsh7th/cmp-nvim-lua', -- Vim api functions
    'hrsh7th/cmp-cmdline', -- Complete when using :
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'onsails/lspkind-nvim', -- adds vscode-like pictograms to neovim built-in lsp
  },
  config = function()
    require('config.cmp')
  end
}
use { -- Install and configure treesitter languages
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup({
      vim.cmd[[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
      ]]
    })
  end
}
use { -- Connect external linters (phpcs, black) to LSP
  'mfussenegger/nvim-lint',
  config = function()
    require('config.lint')
  end
}
use { -- Find files, buffers, keys, etc with :Telescope <command>
  'nvim-telescope/telescope.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    { 'kyazdani42/nvim-web-devicons', opt = true },
    'nvim-telescope/telescope-frecency.nvim', -- Better sorting algorithm
    'tami5/sqlite.lua', -- required by fequency
    'nvim-telescope/telescope-file-browser.nvim',
    'nvim-telescope/telescope-packer.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    -- 'nvim-telescope/telescope-fzf-native.nvim', -- Better file search
  },
  config = function()
    require('config.telescope')
  end
}
use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    config = function()
      require('config.nvim-tree')
    end
}
use { -- Use FZF for faster file search (didn't work as telescope requierement).
  'nvim-telescope/telescope-fzf-native.nvim',
  requires = {
    'nvim-telescope/telescope.nvim',
  },
  run = 'make',
  config = function()
    require('telescope').load_extension('fzf')
  end
}
use { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    vim.g.indent_blankline_char =  '┊'
    vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
    vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
    vim.g.indent_blankline_show_trailing_blankline_indent = false
  end
}
use {-- Make the status line beautiful
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = function()
    require('config.lualine')
  end
}
use { -- Preview current markdown file with :MarkdownPreview
  'iamcco/markdown-preview.nvim',
  run = 'cd app && npm install',
  ft = { 'markdown' },
  cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle' } -- Load on this commands
}
use { -- Better hightlighting
  'sheerun/vim-polyglot'
}

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
  require("packer").sync()
end
-- vim: ts=2 sw=2 et
