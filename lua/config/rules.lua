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
local function aug(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
  group = aug("AutoReadChecktime"),
  pattern = "*",
  command = "checktime",
})

local uv = vim.uv or vim.loop
vim.o.autoread = true

local watchers = {}

local function stop_watch(buf)
  local w = watchers[buf]
  if w then
    pcall(w.stop, w); pcall(w.close, w); watchers[buf] = nil
  end
end

local function start_watch(buf)
  stop_watch(buf)
  if not vim.api.nvim_buf_is_valid(buf) then return end
  local name = vim.api.nvim_buf_get_name(buf)
  if name == "" or vim.fn.filereadable(name) == 0 then return end

  local w = uv.new_fs_event()
  w:start(name, {}, function(err, _fname, _status)
    if err then return end
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(buf) then return stop_watch(buf) end
      if not vim.bo[buf].modified then
        pcall(vim.cmd, "silent! checktime " .. buf)
        local short = vim.fn.fnamemodify(name, ":t")
      else
      end
    end)
  end)

  watchers[buf] = w
end

-- Start/stop watchers as buffers come and go
vim.api.nvim_create_autocmd({ "BufReadPost", "BufFilePost" }, {
  group = vim.api.nvim_create_augroup("FSWatchStart", { clear = true }),
  callback = function(args) start_watch(args.buf) end,
})

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  group = vim.api.nvim_create_augroup("FSWatchRefresh", { clear = true }),
  callback = function(args) start_watch(args.buf) end, -- refresh after save/rename
})

vim.api.nvim_create_autocmd({ "BufWipeout", "BufUnload", "BufDelete" }, {
  group = vim.api.nvim_create_augroup("FSWatchStop", { clear = true }),
  callback = function(args) stop_watch(args.buf) end,
})
