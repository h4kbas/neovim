return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
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
        defaults = {

          mappings = {
            i = {
              ["<c-d>"] = function(arg)
                vim.api.nvim_command("wall")
                require("telescope.actions").delete_buffer(arg)
              end,
              ["<C-S-d>"] = function(arg)
                require("telescope.actions").delete_buffer(arg)
              end,
            },
            n = {
              ["<c-d>"] = function(arg)
                vim.api.nvim_command("wall")
                require("telescope.actions").delete_buffer(arg)
              end,
              ["<C-S-d>"] = function(arg)
                require("telescope.actions").delete_buffer(arg)
              end,

            }
          }
        }
      })

      local builtin = require('telescope.builtin')
      local action_state = require('telescope.actions.state')
      local actions = require('telescope.actions')

      -- Files
      map("n", "<leader><leader>", builtin.oldfiles, {})
      map('n', '<leader>fr', builtin.resume, {})
      map('n', '<leader>fp', builtin.git_status, {})
      map('n', '<leader>fb', builtin.buffers, {})
      
      -- Search
      map('n', '<leader>ff', builtin.find_files, {})
      map('n', '<leader>fg', builtin.live_grep, {})
      
      -- System
      map('n', '<leader>fk', builtin.keymaps, {})
      map('n', '<leader>fh', builtin.highlights, {})
      -- Extensions
      require("telescope").load_extension("ui-select")
      require("telescope").load_extension("fzf")
    end,
  },
}
