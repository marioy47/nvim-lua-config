-- lua/plugins.lua

-- Execute `:so %`,  `:PackerSync` and `:PackerCompile` after each change

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').reset()
require('packer').init {
  compile_path = vim.fn.stdpath 'data' .. '/site/plugin/packer_compiled.lua', -- Now we don't need to gitignore the ./plugins directory
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'solid' }
    end,
  },
}

local use = require('packer').use

--[[
  Start adding plugins here
--]]
use { -- Have packer manage itself
  'wbthomason/packer.nvim',
}
use { -- Port of VSCode's Tokio Night theme
  'folke/tokyonight.nvim',
  config = function()
    require('tokyonight').setup {
      styles = { functions = 'bold', keywords = 'italic' },
    }
    vim.cmd.colorscheme 'tokyonight-moon'
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
use { -- Align items to a character. Useful on WordPress development.
  'Vonr/align.nvim',
  config = function()
    local NS = { noremap = true, silent = true }
    vim.keymap.set('x', 'ga', function()
      require('align').align_to_string(false, true, true)
    end, NS) -- Aligns to a string, looking left and with previews
  end,
}
use { -- Make the status line beautiful and more useful
  'nvim-lualine/lualine.nvim',
  config = function()
    require 'plugins.lualine'
  end,
}
use { -- Sets tabstop and shiftwidth automatically (:Sleuth). It also supports .editorconfig
  'tpope/vim-sleuth',
}
use { -- Add indentation guides
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('indent_blankline').setup {
      char = '┊',
      show_trailing_blankline_indent = false,
    }
  end,
}
use { -- Show the actual color or RGB or CMYK values in css, html and sass files (pe #ff00ee)
  'norcalli/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup {
      'html',
      'css',
      'javascript',
      'scss',
      'sass',
    }
  end,
}
use { -- Auto add closing quotes, brackets, tags, etc. Great time saver
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup {}
  end,
}
use { -- Show GIT changes on the gutter and add some git visualizations with <Leader>g
  'lewis6991/gitsigns.nvim',
  config = function()
    require 'plugins.gitsigns'
  end,
}
use { -- Sidebar file explorer (NetRW replacement)
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
  ft = { 'markdown' }, -- Only on md files since this is a big plugin.
  cmd = { 'MarkdownPreview', 'MarkdownPreviewToggle' }, -- Load on this commands
}
use { -- Floating terminal with <leader>tt
  'voldikss/vim-floaterm',
  config = function()
    vim.g.floaterm_width = 0.9
    vim.g.floaterm_height = 0.8
    vim.keymap.set('n', '<Leader>tt', '<cmd>FloatermToggle<cr>')
    vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n><cmd>FloatermToggle<cr>')
  end,
}
use { -- Fuzzy finder to find files, grep content, list buffers, etc.
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
use { -- Better code highlight, and adds source code navigation like `]m` or `[[`
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
use { -- Adds the `:Neogen [type]` command to add annotations on functions, classes, etc.
  'danymat/neogen',
  config = function()
    require('neogen').setup {}
  end,
  requires = 'nvim-treesitter/nvim-treesitter',
}
use { -- Split arrays and methods onto multiple lines, or join them back up with gS and gJ
  'AndrewRadev/splitjoin.vim',
  config = function()
    vim.g.splitjoin_html_attributes_bracket_on_new_line = 1
    vim.g.splitjoin_trailing_comma = 1
    vim.g.splitjoin_php_method_chain_full = 1
  end,
}
use { -- Autoclose html and jsx tags. Auto rename closing tag.
  'windwp/nvim-ts-autotag',
  after = 'nvim-treesitter/nvim-treesitter',
  requires = 'nvim-treesitter/nvim-treesitter',
  disable = true,
}
use { -- Language Server configuration
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'saadparwaiz1/cmp_luasnip' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' },
    { 'rafamadriz/friendly-snippets' },

    -- Mario Yepes: Useful status updates for LSP
    { 'j-hui/fidget.nvim' },

    -- Mario Yepes; null-ls integration
    'jose-elias-alvarez/null-ls.nvim',
    'jay-babu/mason-null-ls.nvim',

    -- Mario Yepes: Additional autompletion sources
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'b0o/schemastore.nvim',
  },
  config = function()
    require 'plugins.lsp'
  end,
}
--[[
  Finish plugin configuration
--]]

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if packer_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until it completes, then restart nvim'
  print '=================================='
  require('packer').sync()
end
