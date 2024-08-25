return {
  "stevearc/oil.nvim",
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = true,
      use_default_keymaps = false,
      keymaps = require("config.bindings").Custom_oil_mappings,
      skip_confirm_for_simple_edits = true,
      view_options = {
        show_hidden = true,
        Vnatural_order = true,
      },
      watch_for_changes = false,
    })
  end,
}
