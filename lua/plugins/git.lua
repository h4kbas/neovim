return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional - Diff integration

      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = function()
      local neogit = require("neogit")
      neogit.setup({
        integrations = {
          diffview = true
        }
      })
    end
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
        },
        signs = {
          add          = { text = 'U', }, -- Untracked file
          change       = { text = 'M', }, -- Modified file
          delete       = { text = 'D', }, -- Deleted file
          topdelete    = { text = 'D', }, -- Top deleted line
          changedelete = { text = 'M', }, -- Changed and deleted line
          untracked    = { text = 'U', }, -- Untracked file
        },
        signs_staged = {
          add          = { text = 'S', }, -- Staged add
          change       = { text = 'M', }, -- Staged modified
          delete       = { text = 'D', }, -- Staged delete
          topdelete    = { text = 'D', }, -- Staged top delete
          changedelete = { text = 'M', }, -- Staged change and delete
          untracked    = { text = 'U', }, -- Staged untracked
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
  }
}
