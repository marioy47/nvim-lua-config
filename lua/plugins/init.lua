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
    require 'plugins.nightfox'
  end,
}
use { -- Material theme with multiple subthemes
  'marko-cerovac/material.nvim',
  config = function()
    require 'plugins.material'
  end,
}
use { -- Inline help for key combinations on normal mode
  'folke/which-key.nvim',
  config = function()
    require('which-key').setup {
      plugins = {
        spelling = {
          enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
        },
      },
      window = {
        margin = { 0, 0, 0, 0 }, -- remove window margin [top, right, bottom, left]
        padding = { 0, 0, 0, 0 }, -- remove window padding [top, right, bottom, left]
      },
    }
  end,
}
use { -- Fast commenting! Enable gcc and gcb for comments
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end,
}
use {
  'Vonr/align.nvim',
  config = function()
    require 'plugins.align'
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
    require 'plugins.lualine'
  end,
}
use { -- Support for .editorconfig files
  'gpanders/editorconfig.nvim',
}
use { -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',
}
use { -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      char = '┊',
      show_trailing_blankline_indent = false,
    }
  end,
}
use { -- Show the actual color or RGB or CMYK values in your code (pe #ff00ee)
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
use { -- Show GIT changes on the gutter and add some git visualiztions with <Leader>g
  'lewis6991/gitsigns.nvim',
  config = function()
    require 'plugins.gitsigns'
  end,
}
use { -- Nvim-tree: Sidebar explorer and NetRW replacement
  'kyazdani42/nvim-tree.lua',
  requires = {
    'kyazdani42/nvim-web-devicons', -- optional, for file icon
  },
  config = function()
    require 'plugins.nvim-tree'
  end,
}
use { -- Preview current markdown file with :MarkdownPreview
  'iamcco/markdown-preview.nvim',
  run = 'cd app && npm install',
  ft = { 'markdown' },
  cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle' }, -- Load on this commands
}
use { -- Fizzy finder to find files, grep content, list buffers, etc.
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  requires = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    require 'plugins.telescope'
  end,
}
use { -- Use native FZF in telescope
  'nvim-telescope/telescope-fzf-native.nvim',
  run = 'make',
  cond = vim.fn.executable 'make' == 1,
}
use { -- Install and configure treesitter languages
  'nvim-treesitter/nvim-treesitter',
  run = function()
    require('nvim-treesitter.install').update { with_sync = true } -- Avoids TSUpdate failing on first run
  end,
  config = function()
    require 'plugins.treesitter'
  end,
}
use { -- Additional text objects (similar to paragraph manipulation) via treesitter
  'nvim-treesitter/nvim-treesitter-textobjects',
  after = 'nvim-treesitter',
}
use { -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  requires = {
    'williamboman/mason.nvim', -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason-lspconfig.nvim',
    'j-hui/fidget.nvim', -- Useful status updates for LSP
    'folke/neodev.nvim', -- Additional lua configuration, makes nvim stuff amazing
  },
  config = function()
    require 'plugins.lspconfig'
  end,
}
use { -- Access to the [SchemaStore](https://github.com/SchemaStore/schemastore) catalog
  'b0o/schemastore.nvim',
  config = function()
    require('lspconfig').jsonls.setup {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end,
}
use { -- Autocompletion
  'hrsh7th/nvim-cmp',
  requires = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    require 'plugins.cmp'
  end,
}
use { -- Null-LS Use external formatters and linters
  'jose-elias-alvarez/null-ls.nvim',
  config = function()
    require 'plugins.null-ls'
  end,
  requires = {
    'nvim-lua/plenary.nvim',
  },
}
--[[
  Finish plugin configuration
--]]

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until it completes, then restart nvim'
  print '=================================='
  require('packer').sync()
end
