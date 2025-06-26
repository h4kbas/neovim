return {
  {
    "onurcancamci/quick-todo.nvim",
    config = function()
      require("quick-todo").setup({
        keys = {
          open = "<leader>t"
        },
        window = {
          height = 0.5,
          width = 0.5,
          winblend = 0,
          border = "rounded",
        }
      })
    end
  },
}
