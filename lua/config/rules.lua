vim.api.nvim_create_autocmd("FileType", {
  pattern = "Neogit*",
  callback = function()
    require('colorizer').detach_from_buffer(0)
  end,
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "Diffview*",
  callback = function()
    require('colorizer').detach_from_buffer(0)
  end,
})

-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*.js,*,jsx,*.ts,*.tsx",
--   callback = function()
--     -- vim.lsp.buf.format()
--   end,
-- })

vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  callback = function()
    local root = vim.fs.find({ 'package.json', 'tsconfig.json' }, { upward = true })[1]
    if root then
      vim.cmd('cd ' .. vim.fs.dirname(root))
    end
  end,
})

-- vim.api.nvim_create_autocmd('User', {
--   pattern = 'GitConflictDetected',
--   callback = function()
--     vim.notify('Conflict detected in '..vim.fn.expand('<afile>'))
--     vim.keymap.set('n', 'cww', function()
--       engage.conflict_buster()
--       create_buffer_local_mappings()
--     end)
--   end
-- })
