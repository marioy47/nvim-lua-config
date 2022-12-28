-- init.lua

-- Required to be here by the plugin nvim-tree
--vim.g.loaded_netrw = 1
--vim.g.loaded_netrwPlugin = 1

-- Vim native options. Make it more modern
require 'options'

-- Vim commands and autocommands
require 'commands'

-- All keymaps in one file for easier research
require 'keymaps'

-- Plugins and plugin configuration
require 'plugins'

-- For a list of Colors, execute  `:echo getcompletion('', 'color')`
vim.cmd 'silent! colorscheme tokyonight-night'
