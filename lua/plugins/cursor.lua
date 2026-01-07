return {
  {
    "h4kbas/cursor.nvim",
    dir = "~/Desktop/projects/cursor.nvim", -- For local development
    config = function()
      require('cursor').setup({
        chat_width = 50,
        model = 'auto',
      })
    end
  }
}
