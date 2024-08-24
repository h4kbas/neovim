return {
  {
    "chentoast/marks.nvim",
    config = function()
      local marks = require("marks")
      marks.setup({
        default_mappings = true,
        builtin_marks = { ".", "<", ">", "^" },
        cyclic = true,
        force_write_shada = false,
        refresh_interval = 250,
        -- default 10.
        sign_priority = { lower = 2, upper = 3, builtin = 1, bookmark = 4 },
        excluded_filetypes = {},
        excluded_buftypes = {
          "nofile",
        },
        -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
        -- sign/virttext. Bookmarks can be used to group together positions and quickly move
        -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
        -- default virt_text is "".
        -- bookmark_0 = {
        --   sign = "⚑",
        -- },
        -- bookmark_1 = {
        --   sign = "",
        -- },
        -- bookmark_2 = {
        --   sign = "",
        -- },
        mappings = {},
      })
    end,
  },
}
