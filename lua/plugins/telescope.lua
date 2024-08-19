return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local map = vim.keymap.set
      local telescope = require("telescope")
      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })

      local builtin = require('telescope.builtin')
      local action_state = require('telescope.actions.state')
      local actions = require('telescope.actions')


      map("n", "<leader><leader>", builtin.oldfiles, {})
      map('n', '<leader>ff', builtin.find_files, {})
      map('n', '<leader>fg', builtin.live_grep, {})
      map('n', '<leader>fb', builtin.buffers, {})
      map('n', '<leader>fh', builtin.keymaps, {})
      map('n', '<leader>fp', builtin.git_files, {})
      map('n', '<leader>fr', builtin.resume, {})


      require("telescope").load_extension("ui-select")
    end,
  },
}
