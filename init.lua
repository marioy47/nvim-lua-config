-- init.lua

-- Setup the color at start
vim.cmd[[silent! colorscheme tokyonight]]
vim.g.vimwiki_list = {
  {
    path = '~/.vimwiki/',
    syntax = 'markdown',
    ext = '.md'
  }
}

require("options")
require("keymaps")
require("commands")
require("plugins")

