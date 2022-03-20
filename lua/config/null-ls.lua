-- lua/config/null-ls.lua

local null_ls = require("null-ls")
local utils = require("null-ls.utils")

null_ls.setup({
    debug = true,
    root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"), -- Add composer
    diagnostics_format = "#{m} (#{c}) [#{s}]", -- Makes PHPCS errors more readeable
    sources = {
        -- null_ls.builtins.code_actions.eslint,
        null_ls.builtins.code_actions.eslint_d,
        null_ls.builtins.completion.spell, -- You still need to execute `:set spell`
        null_ls.builtins.diagnostics.markdownlint, -- Markdown style and syntax checker.
        null_ls.builtins.diagnostics.phpcs.with({ -- Change how the php linting will work
            prefer_local = "vendor/bin",
        }),
        null_ls.builtins.formatting.markdownlint, -- A Node.js style checker and lint tool for Markdown/CommonMark files.
        null_ls.builtins.formatting.phpcbf.with({ -- Use the local installation first
            prefer_local = "vendor/bin",
        }),
    },
})
