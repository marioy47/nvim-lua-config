-- init.lua

-- Required to be here by the plugin nvim-tree (https://github.com/nvim-tree/nvim-tree.lua#setup)
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Vim native options. Make it more modern
require 'options'

-- Vim commands and autocommands
require 'commands'

-- All keymaps in one file for easier research
require 'keymaps'

-- Plugins and plugin configuration
require 'plugins' -- plugins/init.lua
