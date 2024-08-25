return {
  {
    "chentoast/marks.nvim",
    config = function()
      local marks = require("marks")
      marks.setup({
        default_mappings = false,
        builtin_marks = { ".", "<", ">", "^" },
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 250,
        -- default 10.
        sign_priority = { lower = 3, upper = 4, builtin = 2, bookmark = 5 },
        excluded_filetypes = {},
        excluded_buftypes = {
          "nofile",
        },
        mappings = require("config.bindings").Custom_marks_mappings,
      })
    end,
  },
}
