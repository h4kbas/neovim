return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        Vnatural_order = true,
      },
      watch_for_changes = false,
      win_options = {
        signcolumn = "yes:2",
      },
    })
    vim.keymap.set("n", "-", oil.toggle_float, {})
  end,
}
