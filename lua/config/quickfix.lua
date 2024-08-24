vim.api.nvim_create_autocmd("FileType", {
  pattern = "typescript,typescriptreact",
  callback = function()
    vim.opt_local.makeprg = "tsc --noEmit"
    vim.bo.errorformat = [[%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m]]
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.bo.errorformat = [[%f\|%l\ col\ %c\|%m]]
  end,
})

-- Global defaults for TypeScript files
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.ts,*.tsx",
  callback = function()
    vim.opt_local.makeprg = "tsc --noEmit"
    vim.bo.errorformat = [[%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m]]
  end,
})

-- Global defaults for quickfix buffers
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
  pattern = "*.qf",
  callback = function()
    vim.bo.errorformat = [[%f\|%l\ col\ %c\|%m]]
  end,
})
