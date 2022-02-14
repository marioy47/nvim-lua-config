-- lua/config/telescope.lua

require"telescope".load_extension("frecency")
require('telescope').load_extension('file_browser')
require('telescope').load_extension('packer')
require("telescope").load_extension("ui-select")
require('telescope').setup({
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  }
})
