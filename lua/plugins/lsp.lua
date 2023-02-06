-- Show something more than a mere bullet on the list of installed servers
require('mason.settings').set {
  ui = {
    border = 'rounded',
    icons = {
      package_installed = '✓',
      package_pending = '➜',
      package_uninstalled = '✗',
    },
  },
}

-- Display LSP status on the bottom right corner
require('fidget').setup()

-- Config LSP Zero
local lsp = require 'lsp-zero'
lsp.preset 'recommended'
lsp.ensure_installed {
  'cssls',
  'emmet_ls',
  'eslint',
  'intelephense',
  'jsonls',
  'sumneko_lua',
  'tsserver',
  'vimls',
}

-- Fix Undefined global 'vim'
lsp.configure('sumneko_lua', {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        globals = { 'vim' },
      },
    },
  },
})

lsp.configure('intelephense', {
  settings = {
    intelephense = {
      stubs = {
        'apache',
        'bcmath',
        'bz2',
        'calendar',
        'com_dotnet',
        'Core',
        'ctype',
        'curl',
        'date',
        'dba',
        'dom',
        'enchant',
        'exif',
        'FFI',
        'fileinfo',
        'filter',
        'fpm',
        'ftp',
        'gd',
        'gettext',
        'gmp',
        'hash',
        'iconv',
        'imap',
        'intl',
        'json',
        'ldap',
        'libxml',
        'mbstring',
        'meta',
        'mysqli',
        'oci8',
        'odbc',
        'openssl',
        'pcntl',
        'pcre',
        'PDO',
        'pdo_ibm',
        'pdo_mysql',
        'pdo_pgsql',
        'pdo_sqlite',
        'pgsql',
        'Phar',
        'posix',
        'pspell',
        'random',
        'readline',
        'Reflection',
        'session',
        'shmop',
        'SimpleXML',
        'snmp',
        'soap',
        'sockets',
        'sodium',
        'SPL',
        'sqlite3',
        'standard',
        'superglobals',
        'sysvmsg',
        'sysvsem',
        'sysvshm',
        'tidy',
        'tokenizer',
        'xml',
        'xmlreader',
        'xmlrpc',
        'xmlwriter',
        'xsl',
        'Zend OPcache',
        'zip',
        'zlib',
        'wordpress',
      },
    },
  },
})

-- Use [Kickstart](https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua) keymaps
lsp.on_attach(function(client, bufnr)
  -- if client.name == "eslint" then
  --   vim.cmd.LspStop('eslint')
  --   return
  -- end
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end)

lsp.setup()

-- Integration with [Null-Ls](https://github.com/VonHeikemen/lsp-zero.nvim/blob/main/advance-usage.md#intergrate-with-null-ls)
local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.markdownlint.with {
      extra_args = { '--disable', 'line-length' },
    }, -- Install it with `npm i -g markdownlint-cli`
    null_ls.builtins.diagnostics.phpcs.with { -- Use the local installation first
      diagnostics_format = '#{m} (#{c}) [#{s}]', -- Makes PHPCS errors more readeable
      only_local = 'vendor/bin',
    },
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.formatting.phpcbf.with {
      prefer_local = 'vendor/bin',
    },
    null_ls.builtins.formatting.prettierd,
  },
}

-- see documentation of null-null-ls for more configuration options!
local mason_nullls = require 'mason-null-ls'
mason_nullls.setup {
  ensure_installed = { 'stylua', 'jq', 'prettierd' },
  automatic_installation = true,
  automatic_setup = true,
}
mason_nullls.setup_handlers {}
