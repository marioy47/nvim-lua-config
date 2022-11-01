-- init.lua

-- LSP servers to install by default (you can add more with :LspInstallInfo)
vim.g.lsp_servers = {
    "bashls",
    "emmet_ls",
    --"grammarly",
    "jsonls",
    "sumneko_lua",
    "tsserver",
    "yamlls",
    "cssls",
    "html",
    "intelephense",
}

-- Vim native options. Make it more modern
require("options")

-- Vim commands and autocommands
require("commands")

-- All keymaps in one file for easier research
require("keymaps")

-- Plugins and plugin configuration
-- require("plugins")

-- Execute `:echo getcompletion('', 'color')` for a list of color schemes
vim.cmd([[silent! colorscheme tokyonight]])
