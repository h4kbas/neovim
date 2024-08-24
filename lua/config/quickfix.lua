-- Error capture for quickfix
vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.ts,*.tsx",
  callback = function(args)
    vim.opt_local.makeprg = "tsc --noEmit"
    vim.bo[args.buf].errorformat = [[%+A\ %#%f\ %#(%l\\\,%c):\ %m,%C%m]]
  end,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.qf",
  callback = function(args)
    vim.bo[args.buf].errorformat = [[%f\|%l\ col\ %c\|%m]]
  end,
})
