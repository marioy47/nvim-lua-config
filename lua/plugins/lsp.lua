-- Show something more than a mere bullet on the list of installed servers
require('mason').setup {
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
local lsp = require('lsp-zero').preset 'recommended'

-- Add keymappings to the current buffer
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps { buffer = bufnr, preserve_mappings = true }

  -- Additional keymappings for 60% keybards.
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = '[R]e[n]ame', buffer = bufnr })
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = '[C]ode [A]ction', buffer = bufnr })
  vim.keymap.set('n', '<leader>bf', vim.lsp.buf.format, { desc = '[B]uffer [F]ormat', buffer = bufnr })
end)

lsp.ensure_installed {
  'lua_ls',
  'intelephense',
  'tsserver',
  'cssls',
  'jsonls',
  'bashls',
  'marksman',
  'astro',
  -- 'cspell',
}

-- Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- Enable autompletion of keys in conf files like `package.json` or `.eslintrc.json`
require('lspconfig').jsonls.setup {
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
    },
  },
}

lsp.setup()

-- Null-Ls for formatting and linting using external tools.
local null_ls = require 'null-ls'
null_ls.setup {
  sources = {
    -- Eslint
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file { '.eslintrc.js', '.eslintrc.json' }
      end,
    },
    null_ls.builtins.diagnostics.eslint_d.with {
      condition = function(utils)
        return utils.root_has_file { '.eslintrc.js', '.eslintrc.json' }
      end,
    },

    -- Markdown.
    null_ls.builtins.formatting.markdownlint,
    null_ls.builtins.diagnostics.markdownlint.with {
      extra_args = { '--disable', 'line-length' },
    },

    -- Php (PHPCS, PHPCBF, PHPStan)
    null_ls.builtins.diagnostics.phpcs.with { -- Use the local installation first
      diagnostics_format = '#{m} (#{c}) [#{s}]', -- Makes PHPCS errors more readeable
      only_local = 'vendor/bin',
    },
    null_ls.builtins.formatting.phpcbf.with {
      prefer_local = 'vendor/bin',
    },
    null_ls.builtins.diagnostics.phpstan,

    -- Prettier and spelling
    null_ls.builtins.formatting.prettierd,

    -- Spelling
    null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
    null_ls.builtins.diagnostics.cspell,
    null_ls.builtins.code_actions.cspell,
  },
}

-- Install linting and formating apps using Mason.
local mason_nullls = require 'mason-null-ls'
mason_nullls.setup {
  ensure_installed = { 'stylua', 'jq', 'prettierd', 'markdownlint' },
  automatic_installation = true,
  automatic_setup = true,
}
