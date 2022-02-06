-- plugins.lua

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.vim"
local packer_bootstrap

-- Loads the `name` config file. Used on the `config` packer param
function get_config(name)
  return string.format("require(\"config/%s\")", name)
end

-- Bootstrap packer if not installed
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim", 
    install_path
  })
  vim.cmd "packadd packer.vim"
end

local packer = require("packer")
packer.init()
local use = packer.use
packer.reset()

use "wbthomason/packer.nvim"     -- Have packer manage itself

-- use "mhartington/oceanic-next"   -- Beautiful pastell-y colors
use {
  "folke/tokyonight.nvim",      -- Port of VSCode"s Tokio Night
  config = get_config("tokionight")
}
use {
  "nvim-lualine/lualine.nvim",
  requires = { "kyazdani42/nvim-web-devicons", opt = true },
  config = get_config("lualine")
}


if packer_bootstrap then
  require("packer").sync()
end

-- vim: ts=2 sw=2 et

