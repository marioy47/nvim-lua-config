-- config/lsp.lua

-- Long function name shortcuts
local keymap = vim.api.nvim_buf_set_keymap
local option = vim.api.nvim_buf_set_option

local lsp_setup_opts = {
  on_attach = function(client)
    keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
    keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    keymap(0, 'n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {noremap = true})
    print('LSP attached')
  end
}

require('nvim-lsp-installer').on_server_ready( function(server)
  server:setup(lsp_setup_opts) -- This get passed to "lspconfig".setup
end)

-- require('lspconfig').pyright.setup(lsp_setup_opts)

-- vim: ts=2 sw=2 et
