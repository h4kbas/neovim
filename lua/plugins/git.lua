return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      -- Only one of these is needed.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup({
        sign_priority = 1,
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 500,
          virt_text_pos = 'eol', -- Blame appears at the end of the line
        },
        -- Changing letters to a solid bar
        signs = {
          add          = { text = "▌" },
          change       = { text = "▌" },
          delete       = { text = "▌" },
          topdelete    = { text = "▌" },
          changedelete = { text = "▌" },
          untracked    = { text = "▌" },
        },
        signs_staged = {
          add          = { text = "▌" },
          change       = { text = "▌" },
          delete       = { text = "▌" },
          topdelete    = { text = "▌" },
          changedelete = { text = "▌" },
          untracked    = { text = "▌" },
        },
      })
    end
  },
  {
    "sindrets/diffview.nvim",
    config = function()
      local diffview = require("diffview")
      diffview.setup({
        hooks = {
          view_opened = function(view)
            -- Customize the behavior when a view is opened
            vim.cmd("set diffopt+=iwhite") -- Ignore all whitespace changes
            vim.cmd("set diffopt-=filler") -- Disable filler lines for deleted lines
          end,
        },
      })
    end
  },
  {
    'akinsho/git-conflict.nvim',
    version = "*",
    config = function()
      local gitconflict = require("git-conflict")
      gitconflict.setup({
        default_mappings = false
      })
    end
  },
}
