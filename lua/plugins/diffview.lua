return {
  {
    "sindrets/diffview.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", lazy = true },
    },
    config = function()
      local diffview = require("diffview")
      diffview.setup({
        hooks = {
          view_opened = function(view)
            vim.opt.fillchars:append({ diff = " " })
          end,
        },
        view = {
          -- default = {
          --   -- For vertical, use "diff2_vertical"
          --   layout = "diff2_vertical",
          -- },
          merge_tool = {
            layout = "diff3_mixed",
          },
          -- file_history = {
          --   layout = "diff2_vertical",
          -- },
        },
      })
    end,
  },
}
