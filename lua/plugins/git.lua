return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local map = vim.keymap.set
      local gitsigns = require("gitsigns")
      gitsigns.setup({
        signs = {
          add          = { text = 'U' }, -- Untracked file
          change       = { text = 'M' }, -- Modified file
          delete       = { text = 'D' }, -- Deleted file
          topdelete    = { text = 'T' }, -- Top deleted line
          changedelete = { text = 'C' }, -- Changed and deleted line
          untracked    = { text = 'U' }, -- Untracked file
        },
        signs_staged = {
          add          = { text = 'S' }, -- Staged add
          change       = { text = 'M' }, -- Staged modified
          delete       = { text = 'D' }, -- Staged delete
          topdelete    = { text = 'T' }, -- Staged top delete
          changedelete = { text = 'C' }, -- Staged change and delete
          untracked    = { text = 'U' }, -- Staged untracked
        },
      })

      map('n', '<leader>hS', gitsigns.stage_buffer)
      map('n', '<leader>hU', gitsigns.reset_buffer_index)

      map({ 'n', 'v' }, '<leader>hs', gitsigns.stage_hunk)
      map({ 'n', 'v' }, '<leader>hr', gitsigns.reset_hunk)
      map('n', '<leader>hu', gitsigns.undo_stage_hunk)

      map('n', '<leader>hd', gitsigns.diffthis)
      map('n', '<leader>hD', function() gitsigns.diffthis('~') end)

      map("n", "<leader>hp", gitsigns.preview_hunk)
      map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end)
      map("n", "<leader>ht", gitsigns.toggle_current_line_blame)

      map("n", '<leader>hv', gitsigns.select_hunk)
      map("n", ']h', gitsigns.next_hunk)
      map("n", '[h', gitsigns.prev_hunk)
    end
  }
}
