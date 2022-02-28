-- lua/config/nulln-ls.lua

local null_ls = require('null-ls')
local utils = require("null-ls.utils")

null_ls.setup({
	sources = {
		null_ls.builtins.completion.spell,
		null_ls.builtins.diagnostics.eslint, -- Ditto: npm instal eslint
		null_ls.builtins.diagnostics.phpcs.with({
			command = "./vendor/bin/phpcs", -- composer install phpcs --dev
            root_dir =  utils.root_pattern(".null-ls-root", "composer.json", "composer.lock", ".git"),
        }),
		null_ls.builtins.formatting.stylua, -- You need to install stylue first: brew install stylua
		null_ls.builtins.formatting.phpcbf.with({
			command = "./vendor/bin/phpcbf", -- composer install phpcs --dev
            root_dir =  utils.root_pattern(".null-ls-root", "composer.json", "composer.lock", ".git"),
		}),
	},
})
