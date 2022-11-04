-- lua/config/lspconfig.lua

local lspconfig = require("lspconfig")
local util = require("lspconfig.util")

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts) -- Telescope

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    --vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    --vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    --vim.keymap.set("n", "<space>wl", function()
    --    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    --end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", function()
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

lspconfig.tsserver.setup({
    on_attach = on_attach,
})

lspconfig.intelephense.setup({
    on_attach = on_attach,
    root_dir = util.root_pattern("composer.json", ".git", "phpcs.xml", "phpcs.xml.dist", "phpunit.xml"),
})

lspconfig.cssls.setup({
    on_attach = on_attach,
})

lspconfig.stylelint_lsp.setup({
    on_attach = on_attach,
    settings = {
        stylelintplus = {
            -- see available options in stylelint-lsp documentation
        },
    },
})

lspconfig.jsonls.setup({
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        },
    },
})
