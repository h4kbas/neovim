return {
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({
        prefills = {
          search = "",
          replacement = "",
          filesFilter = "",
          flags = "",
          paths = "./src/",
        },
      })
    end,
  },
}
