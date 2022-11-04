-- lua/config/null-ls.lua

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
        null_ls.builtins.diagnostics.eslint_d,
        null_ls.builtins.diagnostics.markdownlint.with({
            extra_args = { "--disable", "line-length" },
        }), -- Install it with `npm i -g markdownlint-cli`
        null_ls.builtins.diagnostics.phpcs.with({ -- Use the local installation first
            diagnostics_format = "#{m} (#{c}) [#{s}]", -- Makes PHPCS errors more readeable
            only_local = "vendor/bin",
        }),
        null_ls.builtins.formatting.eslint_d,
        null_ls.builtins.formatting.markdownlint,
        null_ls.builtins.formatting.phpcbf.with({
            prefer_local = "vendor/bin",
        }),
        null_ls.builtins.formatting.prettier,
    },
})
