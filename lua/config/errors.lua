vim.diagnostic.config({
  virtual_text = true,      -- Disable virtual text for diagnostics
  signs = true,             -- Show signs in the gutter
  underline = true,         -- Underline errors
  update_in_insert = false, -- Don't update diagnostics in insert mode
  severity_sort = true,     -- Sort diagnostics by severity
})


-- Mode: Toggle diagnostics
-- function ToggleDiagnostics()
--   local diagnostics_active = vim.b.diagnostics_active
--   if diagnostics_active == nil or diagnostics_active == true then
--     vim.b.diagnostics_active = false
--     vim.diagnostic.disable()
--   else
--     vim.b.diagnostics_active = true
--     vim.diagnostic.enable()
--   end
-- end
--
-- vim.api.nvim_set_keymap('n', '<leader>td', ':lua ToggleDiagnostics()<CR>', { noremap = true, silent = true })

-- Mode: Errors on status bar
-- vim.api.nvim_create_autocmd("CursorHold", {
--   pattern = "*",
--   callback = function()
--     local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
--     if #diagnostics > 0 then
--       local diagnostic = diagnostics[1]
--       local hl_group = "Normal"
--       if diagnostic.severity == vim.diagnostic.severity.ERROR then
--         hl_group = "ErrorMsg"
--       elseif diagnostic.severity == vim.diagnostic.severity.WARN then
--         hl_group = "WarningMsg"
--       elseif diagnostic.severity == vim.diagnostic.severity.INFO then
--         hl_group = "InfoMsg"
--       elseif diagnostic.severity == vim.diagnostic.severity.HINT then
--         hl_group = "HintMsg"
--       end
--       vim.api.nvim_echo({ { diagnostic.message, hl_group } }, false, {})
--     end
--   end,
-- })
