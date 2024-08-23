return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        fold = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-e>",
            node_incremental = "<C-e>",
            scope_incremental = false,
            node_decremental = "<C-s>",
          },
        },
      })
    end
  }
}
