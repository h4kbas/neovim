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


vim.keymap.set(
  "n",
  "<leader>a",
  ":QFMark<CR>",
  { desc = "Mark line in quickfix list" }
)

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

    vim.keymap.set("x", "d", function()
      if vim.bo.buftype ~= "quickfix" then
        print("Not in quickfix window")
        return
      end

      local qf_list = vim.fn.getqflist({ all = 1 }).items
      local start_line = vim.fn.line("v")
      local end_line = vim.fn.line(".")
      if start_line > end_line then
        start_line, end_line = end_line, start_line
      end

      local new_qf = {}
      for i, item in ipairs(qf_list) do
        if i < start_line or i > end_line then
          table.insert(new_qf, item)
        end
      end

      vim.fn.setqflist({}, "r", { items = new_qf })
      vim.cmd("copen") -- Refresh window visually
    end, { buffer = true, desc = "Delete selected QF items" })
  end,
})
