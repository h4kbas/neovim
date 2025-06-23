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

vim.api.nvim_create_user_command("QFMark", function()
  local pos = vim.api.nvim_win_get_cursor(0)
  local item = {
    filename = vim.fn.expand("%"),
    lnum = pos[1],
    col = pos[2] + 1,
    text = vim.api.nvim_get_current_line(),
  }
  vim.fn.setqflist({ item }, "a")
end, {})

local function delete_qf_item_under_cursor()
  local cursor = vim.fn.line(".") -- line number in qf window
  local qflist = vim.fn.getqflist()
  table.remove(qflist, cursor)    -- remove the selected entry
  vim.fn.setqflist(qflist, "r")   -- replace the list
  vim.cmd("copen")                -- reopen to refresh
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function()
    vim.keymap.set(
      "n",
      "dd",
      delete_qf_item_under_cursor,
      { buffer = true, desc = "Delete qf item" }
    )
  end,
})

vim.keymap.set(
  "n",
  "<leader>a",
  ":QFMark<CR>",
  { desc = "Mark line in quickfix list" }
)
