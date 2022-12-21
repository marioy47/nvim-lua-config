-- lua/config/nvim-dap.lua
-- A list of supported debuggers can be found here: <https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation>

local dap = require 'dap'

local masonFile = function(relative)
  return vim.fn.stdpath 'data' .. relative
end

vim.keymap.set('n', '<Leader>dc', "<cmd>lua require('dap').continue()<cr>")
vim.keymap.set('n', '<Leader>do', "<cmd>lua require('dap').step_over()<cr>")
vim.keymap.set('n', '<Leader>di', "<cmd>lua require('dap').step_into()<cr>")
vim.keymap.set('n', '<Leader>dx', "<cmd>lua require('dap').step_out()<cr>")
vim.keymap.set('n', '<Leader>db', "<cmd>lua require('dap').toggle_breakpoint()<cr>")

--[[
-- PHP
-- :MasonInstall php-debug-adapter
--]]
dap.adapters.php = {
  type = 'executable',
  command = 'node',
  args = { masonFile '/mason/packages/php-debug-adapter/extension/out/phpDebug.js' },
}

dap.configurations.php = {
  {
    type = 'php',
    request = 'launch',
    name = 'Listen for Xdebug',
    port = 9003,
    log = true,
    pathMappings = {
      ['/var/www/html/public'] = '${workspaceFolder}',
    },
  },
}

require('dapui').setup()
require('nvim-dap-virtual-text').setup {
  enabled = true,
}
