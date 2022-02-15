-- lua/config/nvim-tree.lua

require'nvim-tree'.setup {
  auto_close = true,
  diagnostics = {
    enable = true
  },
  view = {
    width = 40,
    side = "right",
  }
}
