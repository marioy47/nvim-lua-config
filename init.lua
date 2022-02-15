-- init.lua

-- Setup the color at start
vim.cmd[[silent! colorscheme nightfox]]
-- vim.cmd[[silent! colorscheme tokyonight]]
require("options")
require("keymaps")
require("commands")
require("plugins")

