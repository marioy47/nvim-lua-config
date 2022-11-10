require("package-info").setup({
    autostart = false,
})

vim.api.nvim_create_user_command("TogglePackageInfo", require("package-info").toggle, {
    desc = "Toggle display npm package version status",
})

vim.api.nvim_create_user_command("NpmInstall", require("package-info").install, {
    desc = "Install npm pacakge (only works in package.json files)",
})

vim.keymap.set(
    { "n" },
    "<Leader>nu",
    require("package-info").update,
    { silent = true, noremap = true, desc = "Update npm package (only in package.json files)" }
)

vim.keymap.set(
    { "n" },
    "<Leader>nd",
    require("package-info").delete,
    { silent = true, noremap = true, desc = "Delete npm package under current line (only in package.json files)" }
)

vim.keymap.set(
    { "n" },
    "<Leader>np",
    require("package-info").change_version,
    { silent = true, noremap = true, desc = "Change version of package in current line (only in package.json files)" }
)
