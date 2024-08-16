return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  config = function()
    local highlight = {
      "CursorColumn",
      "Whitespace",
    }
    vim.api.nvim_set_hl(0, "Whitespace", { fg = "#FFFFFF" })
    require("ibl").setup({
      indent = { highlight = highlight, },
      scope = {
        show_start = false,
        show_end = false,

      }
    })
  end
}
