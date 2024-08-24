vim.api.nvim_create_autocmd("FileType", {
  pattern = "Neogit*",
  callback = function()
    require('colorizer').detach_from_buffer(0)
  end,
})
