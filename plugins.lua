-- plugins.lua

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.vim"
local packer_bootstrap

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

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer manage itself

  -- Automatically set up your configuration after cloning packer.nvim
  if packer_bootstrap then
    require("packer").sync()
  end
end)

-- vim: ts=2 sw=2 et
