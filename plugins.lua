-- plugins.lua

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local fn = vim.fn

-- Automatically install packer
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

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}
packer.reset()
local use = packer.use

-- Start adding plugins here
use {-- Have packer manage itself
  "wbthomason/packer.nvim",
}
--
use {-- Port of VSCode"s Tokio Night theme
  "folke/tokyonight.nvim",
  config = function()
    vim.g.tokyonight_style = "night"
    vim.cmd("colorscheme tokyonight")
  end
}
use {
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  config = function()
    vim.g.indent_blankline_char =  '┊'
    vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
    vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
    vim.g.indent_blankline_show_trailing_blankline_indent = false
  end
}
use {-- Better status line
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = function()
    require('config.lualine')
  end
}
use {-- Enable gcc and gcb for comments
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}
use { -- Configure LSP client and Use an LSP server installer.
    'neovim/nvim-lspconfig',
    requires = { 'williamboman/nvim-lsp-installer' },
    config = function()
      require('config.lsp')
    end
}
use {
  'iamcco/markdown-preview.nvim',
  run = 'cd app && npm install',
  ft = { 'markdown' }
}

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
  require("packer").sync()
end
-- vim: ts=2 sw=2 et
