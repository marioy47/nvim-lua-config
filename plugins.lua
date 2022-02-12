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
use { -- A bunch of plugins requires this 2
  'nvim-lua/popup.nvim',
  'nvim-lua/plenary.nvim',
}
use {-- Port of VSCode"s Tokio Night theme
  "folke/tokyonight.nvim",
}
use {-- Port of VSCode"s Tokio Night theme
  "adrian5/oceanic-next-vim",
}
use { -- A collection of themes: palenight, oceanic, deep ocean, darker, ligher
  'marko-cerovac/material.nvim',
  config = function()
    vim.api.nvim_set_keymap('n', '<leader>mm', [[<Cmd>lua require('material.functions').toggle_style()<CR>]], { noremap = true, silent = true })
    vim.api.nvim_set_keymap('n', '<leader>me', [[<Cmd>lua require('material.functions').toggle_eob()<CR>]], { noremap = true, silent = true })
  end
}
use { -- Configure LSP client and Use an LSP server installer.
    'neovim/nvim-lspconfig',
    requires = { 'williamboman/nvim-lsp-installer' },
    config = function()
      require('config.lsp')
    end
}
use { -- Prettify popups
  'tami5/lspsaga.nvim',
  requires = 'neovim/nvim-lspconfig',
  config = function()
  end
}

-- use { -- Completion engine
--   'hrsh7th/nvim-cmp',
--   requires = {
--     'hrsh7th/cmp-nvim-lsp',
--     'hrsh7th/cmp-buffer',
--     'hrsh7th/cmp-path',
--     'L3MON4D3/LuaSnip',
--     'saadparwaiz1/cmp_luasnip'
--   },
--   config = function()
--     require('config.cmp')
--   end
-- }









use {-- Enable gcc and gcb for comments
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}
--[[
  use { -- https://github.com/wbthomason/dotfiles/blob/linux/neovim/.config/nvim/lua/plugins.lua#L64
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      setup = [[require('config.telescope_setup')] ],
      config = [[require('config.telescope')] ],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }
    use { 'hrsh7th/cmp-nvim-lsp' }
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
use {
  'iamcco/markdown-preview.nvim',
  run = 'cd app && npm install',
  ft = { 'markdown' },
  cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle' } -- Load on this commands
}
]]

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
  require("packer").sync()
end
-- vim: ts=2 sw=2 et
