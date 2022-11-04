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
--]]
use({ -- Have packer manage itself
    "wbthomason/packer.nvim",
})
use({ -- Port of VSCode's Tokio Night theme
    "folke/tokyonight.nvim",
})
use({ -- Another cool dark theme
    "EdenEast/nightfox.nvim",
    config = function()
        require("config.nightfox")
    end,
})
use({ -- Install and configure treesitter languages
    "nvim-treesitter/nvim-treesitter",
    run = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
        require("config.treesitter")
    end,
})
use({ -- Configure LSP client
    "neovim/nvim-lspconfig",
    requires = {
        "b0o/SchemaStore.nvim",
    },
    config = function()
        require("config.lspconfig")
    end,
})
use({
    "williamboman/mason.nvim",
    config = function()
        require("mason").setup()
    end
})
use({
    "hrsh7th/nvim-cmp",
    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-git",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        require("config.cmp")
    end,
})
use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    requires = {
        "nvim-lua/plenary.nvim",
    },
})

--[[
use({ -- Null-LS Use external formatters and linters
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        require("config.null-ls")
    end,
})
use({ -- Trouble: pretty diagnostics
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
        require("trouble").setup({})
    end,
})
use({ -- Telescope: The swiws army knife of searching
    "nvim-telescope/telescope.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-frecency.nvim", -- Better sorting algorithm
            "tami5/sqlite.lua",
        },
        "nvim-telescope/telescope-ui-select.nvim",
        "nvim-telescope/telescope-node-modules.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-symbols.nvim",
    },
    config = function()
        require("config.telescope")
    end,
})
use({ -- Allows you to use `:Rg <search_string>` for fast project search
    "rinx/nvim-ripgrep",
    config = function()
        require("nvim-ripgrep").setup({
            open_qf_fn = require("nvim-ripgrep.extensions").trouble_open_qf,
        })
    end,
})
use({ -- GitSigns: how signs(+, -, ~ ) on the gutter for changed lines on gir tracked files
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
        require("config.gitsigns")
    end,
})
use({ -- Interact with github directly in NeoVim. `:Octo <tab>` for options
    "pwntester/octo.nvim",
    requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "kyazdani42/nvim-web-devicons",
    },
    config = function()
        require("octo").setup()
    end,
})
use({ -- Support for .editorconfig files
    "gpanders/editorconfig.nvim",
})
use({ -- Nvim-tree: Sidebar explorer and NetRW replacement
    "kyazdani42/nvim-tree.lua",
    requires = {
        "kyazdani42/nvim-web-devicons", -- optional, for file icon
    },
    config = function()
        require("config.nvim-tree")
    end,
})
use({ -- Floating terminal with C-k C-t
    "akinsho/toggleterm.nvim",
    config = function()
        require("config.toggleterm")
    end,
})
use({ -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    config = function()
        require("config.indent-blankline")
    end,
})
use({ -- Make the status line beautiful and more useful
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    config = function()
        require("config.lualine")
    end,
})
use({ -- Whichkey: popup help for keymaps
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
use({ -- Align items with `:SimpleAlign --` for instance
    "kg8m/vim-simple-align",
})
use({ -- Preview current markdown file with :MarkdownPreview
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewToggle" }, -- Load on this commands
})
use({ -- Shows you inside your `packaje.json` which packages can be upgraded
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = function()
        require("package-info").setup()
    end,
})
use({ -- Show the actual color or RGB or CMYK values in your code
    "norcalli/nvim-colorizer.lua",
    config = function()
        require("colorizer").setup()
    end,
})
--[[
  Finish plugin configuration
--]]

-- Automatically set up your configuration after cloning packer.nvim
-- Put this at the end after all plugins
if PACKER_BOOTSTRAP then
    require("packer").sync()
end
