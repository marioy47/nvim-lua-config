-- lua/config/nulln-ls.lua

local null_ls = require("null-ls")
local utils = require("null-ls.utils")

null_ls.setup({
	root_dir = utils.root_pattern("composer.json", "package.json", "Makefile", ".git"),
	diagnostics_format = "#{m} (#{c}) [#{s}]",
	sources = {
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.diagnostics.phpcs.with({
			prefer_local = "vendor/bin",
		}),
		null_ls.builtins.formatting.stylua, -- You need to install stylue first: brew install stylua
		null_ls.builtins.formatting.phpcbf.with({
			prefer_local = "vendor/bin",
		}),
	},
})
