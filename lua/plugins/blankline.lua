return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  config = function()
    -- Define the highlight groups
    vim.api.nvim_set_hl(0, "IndentBlanklineChar", { fg = "#FFFFFF", bg = "NONE" })
    vim.api.nvim_set_hl(0, "IndentBlanklineContextChar", { fg = "#FF0000", bg = "NONE" })
    vim.api.nvim_set_hl(0, "BlanklineWhitespace", { fg = "#FFFFFF", bg = "NONE" })

    require("ibl").setup({
      whitespace = {
        highlight = {
          "BlanklineWhitespace", -- Default whitespace color
        }
      },
      indent = {
        highlight = {
          "IndentBlanklineChar", -- Default indent line color
        },
        char = '│',
      },
      scope = {
        show_start = false,
        show_end = false,
        highlight = "IndentBlanklineContextChar", -- Highlight group for the block under the cursor
      }
    })
  end
}
