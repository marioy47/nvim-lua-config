-- config/lsp.lua

local lsp_installer = require('nvim-lsp-installer')

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Remove this in nvim 0.7
local flags = {
  debounce_text_changes = 150
}

-- Pass configurations settings to the different LSP's
local settings = {
  intelephense = {
    -- Add wordpress to the list of stubs
    stubs = {"apache","bcmath","bz2","calendar","com_dotnet","Core","ctype","curl","date","dba","dom","enchant","exif","FFI","fileinfo","filter","fpm","ftp","gd","gettext","gmp","hash","iconv","imap","intl","json","ldap","libxml","mbstring","meta","mysqli","oci8","odbc","openssl","pcntl","pcre","PDO","pdo_ibm","pdo_mysql","pdo_pgsql","pdo_sqlite","pgsql","Phar","posix","pspell","readline","Reflection","session","shmop","SimpleXML","snmp","soap","sockets","sodium","SPL","sqlite3","standard","superglobals","sysvmsg","sysvsem","sysvshm","tidy","tokenizer","xml","xmlreader","xmlrpc","xmlwriter","xsl","Zend OPcache","zip","zlib", "wordpress"},
    diagnostics = {
      enable = false
    }
  },
  Lua = {
    diagnostics = {
      globals = { 'vim' }
    }
  }
}

-- Equivalent (but not equal) to lspconfig.<langserver>.setup{}
lsp_installer.on_server_ready( function(server)
  server:setup({
    on_attach = on_attach,
    flags = flags,
    settings = settings,
  })
end)

-- Auto install servers
local servers = {
  "bashls", "dockerls", "grammarly",
  "jsonls", "sumneko_lua", "yamlls",
}
for _, name in pairs(servers) do
  local is_server_found, server = lsp_installer.get_server(name)
  if is_server_found and not server:is_installed() then
    print("Installing " .. name)
    server:install()
  end
end

--Rounded borders (:help vim.lsp.handlers.hover)
 vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
   vim.lsp.handlers.hover, {
     -- Use a sharp border with `FloatBorder` highlights
     border = "rounded"
   }
 )
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
 vim.lsp.handlers.signature_help, {
   -- Use a sharp border with `FloatBorder` highlights
   border = "rounded"
 }
)

-- vim: ts=2 sw=2 et
