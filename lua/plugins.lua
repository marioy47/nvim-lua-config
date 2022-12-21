-- lua/plugins.lua

-- Place where packer is goint to be saved
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

-- Install packer from github if is not in our system
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
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
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Show packer messages in a popup. Looks cooler
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Alt installation of packer without a function
packer.reset()
local use = packer.use

--[[
  Start adding plugins here
--]]
use { -- Have packer manage itself
  'wbthomason/packer.nvim',
}
use { -- Port of VSCode's Tokio Night theme
  'folke/tokyonight.nvim',
}
use { -- Another cool dark theme
  'EdenEast/nightfox.nvim',
  config = function()
    require 'config.nightfox'
  end,
}
use { -- Material theme with multiple subthemes
  'marko-cerovac/material.nvim',
  config = function()
    require 'config.material'
  end,
}
use { -- Fast commenting! Enable gcc and gcb for comments
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
}
use { -- Inline help for key combinations on normal mode
  'folke/which-key.nvim',
  config = function()
    require 'config.which-key'
  end,
}
use { -- Override nvim-web-devicons with nvim-material-icon (lualine, nvim-tree, etc)
  'kyazdani42/nvim-web-devicons',
  requires = {
    'DaikyXendo/nvim-material-icon',
  },
  config = function()
    require('nvim-web-devicons').setup {
      override = require('nvim-material-icon').get_icons(),
    }
  end,
}
use { -- Make the status line beautiful and more useful
  'nvim-lualine/lualine.nvim',
  config = function()
    require 'config.lualine'
  end,
}
use { -- Nvim-tree: Sidebar explorer and NetRW replacement
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icon
  },
  config = function()
    require 'config.nvim-tree'
  end,
}
use { -- Install and configure treesitter languages
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update { with_sync = true } -- Avoids TSUpdate failing on first run
  end,
  config = function()
    require 'config.treesitter'
  end,
}
use { -- Install language servers using `:MasonInstall <server>`
  'williamboman/mason.nvim',
  requires = {
    'williamboman/mason-lspconfig.nvim',
  },
  config = function()
    require 'config.mason'
  end,
}
use { -- Configure Language Server Protocol
  'neovim/nvim-lspconfig',
  requires = {
    'b0o/SchemaStore.nvim', -- For Json LSP
  },
  config = function()
    require 'config.lspconfig'
  end,
}
use { -- Better dianostics and inline doc display
  'glepnir/lspsaga.nvim',
  branch = 'main',
  config = function()
    require 'config.lspsaga'
  end,
}
use { -- Null-LS Use external formatters and linters
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    require 'config.null-ls'
  end,
  requires = {
    'nvim-lua/plenary.nvim',
  },
}
use { -- Autocomplete engine with plugins for LSP, Snippets, Paths, Commands, etc.
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-git',
    'L3MON4D3/LuaSnip',
  },
  config = function()
    require 'config.cmp'
  end,
}
use { -- Fizzy finder to find files, grep content, list buffers, etc.
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  requires = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-live-grep-args.nvim',
    'nvim-telescope/telescope-ui-select.nvim',
    -- "nvim-telescope/telescope-symbols.nvim",
    -- "nvim-telescope/telescope-dap.nvim",
  },
  config = function()
    require 'config.telescope'
  end,
}
use { -- Show GIT changes on the gutter and add some git visualiztions with <Leader>g
  'lewis6991/gitsigns.nvim',
  config = function()
    require 'config.gitsigns'
  end,
}
-- use({ -- Debugger (Install debuggers with :MasonInstall php-debug-adapter)
--     "mfussenegger/nvim-dap",
--     "rcarriga/nvim-dap-ui",
--     "theHamsta/nvim-dap-virtual-text",
--     requires = {
--     },
--     config = function()
--         require("config.nvim-dap")
--     end,
-- })
use { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
}
use { -- Support for .editorconfig files
  'gpanders/editorconfig.nvim',
}
use { -- Show the actual color or RGB or CMYK values in your code
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup()
  end,
}
use { -- Auto add closing quotes, brackets, tags, etc
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup {}
  end,
}
use {
  'Vonr/align.nvim',
  config = function()
    require 'config.align'
  end,
}
use { -- Preview current markdown file with :MarkdownPreview
  'iamcco/markdown-preview.nvim',
  run = 'cd app && npm install',
  ft = { 'markdown' },
  cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle' }, -- Load on this commands
}
use { -- Shows you inside your `pacakge.json` which packages can be upgraded (:TogglePackageInfo)
  'vuki656/package-info.nvim',
  requires = 'MunifTanjim/nui.nvim',
  config = function()
    require 'config.package-info'
  end,
}
--[[
  Finish plugin configuration
--]]

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
  require('packer').sync()
end
