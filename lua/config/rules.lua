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
--
local function delete_background_buffers()
  -- Get all buffers
  local all_buffers = vim.api.nvim_list_bufs()

  -- Get all windows
  local all_windows = vim.api.nvim_list_wins()

  -- Create a set of displayed buffers
  local displayed_buffers = {}
  for _, win in ipairs(all_windows) do
    local buf = vim.api.nvim_win_get_buf(win)
    displayed_buffers[buf] = true
  end

  -- Collect non-displayed buffers
  local background_buffers = {}
  for _, buf in ipairs(all_buffers) do
    if not displayed_buffers[buf] then
      table.insert(background_buffers, buf)
    end
  end

  -- Close non-displayed buffers
  for _, buf in ipairs(background_buffers) do
    vim.api.nvim_buf_delete(buf, { force = true })
  end
end

vim.api.nvim_create_user_command(
  "DeleteBackgroundBuffers",
  delete_background_buffers,
  {}
)
