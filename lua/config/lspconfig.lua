-- lua/config/lspconfig.lua
-- Based on https://github.com/neovim/nvim-lspconfig#suggested-configuration

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

local opts = { noremap = true, silent = true, desc = "Toggle diagnostics" }
vim.keymap.set("n", "<Leader>dd", vim.diagnostic.setloclist, opts)
vim.api.nvim_create_user_command("ToggleDiagnostics", "lua vim.diagnostics.setloclist()", {
    desc = "Toggle Diagnostics",
})

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
    vim.keymap.set("n", "<Leader>lf", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

lspconfig.sumneko_lua.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            runtime = { -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = { -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = { -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { -- Do not send telemetry data containing a randomized but unique identifier
                enable = false,
            },
        },
    },
})

-- Required for some LSP's
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- JavaScript/TypeScript configuration
lspconfig.tsserver.setup({
    on_attach = on_attach,
})

-- Intelephense (PHP) configuration
lspconfig.intelephense.setup({
    on_attach = on_attach,
    root_dir = util.root_pattern("composer.json", ".git", "phpcs.xml", "phpcs.xml.dist", "phpunit.xml"),
    init_options = {
        licenceKey = os.getenv("INTELEPHENSE_LICENCE"), -- Check the INTELEPHENSE_LICENCE environment variable
    },
})

-- CSS copletion
lspconfig.cssls.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})

-- CSS/Less/Sass formatting and validation
lspconfig.stylelint_lsp.setup({
    on_attach = on_attach,
    root_dir = util.root_pattern(".stylelintrc", "package.json", ".git", ".gitignore"),
})

-- Automplete json schemas
lspconfig.jsonls.setup({
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})
