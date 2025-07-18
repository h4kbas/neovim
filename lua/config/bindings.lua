local M = {}
vim.g.mapleader = " "
vim.cmd("imap jj <ESC>")
-- ## Vim ##
-- Terminal
map("n", "<leader>T", "<cmd>tabnew | te<CR>", { noremap = true })
map("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true })
-- Save
map("n", "S", "s", { noremap = true })
map(
  "n",
  "s",
  "<cmd>w|lua vim.defer_fn( function()vim.cmd('echom \"\"') end, 0)<CR>",
  { noremap = false }
)

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

local function delete_all_buffers()
  local bufs = vim.api.nvim_list_bufs()
  local current_buf = vim.api.nvim_get_current_buf()
  for _, i in ipairs(bufs) do
    if i ~= current_buf then
      vim.api.nvim_buf_delete(i, {})
    end
  end
end

local function save_existing_files()
  -- Get all listed buffers (active in the buffer list)
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    -- Check if the buffer has a name (i.e., is associated with a file)
    local buf_name = vim.api.nvim_buf_get_name(buf)
    -- Check that the file exists on disk and is writable
    if buf_name ~= "" and vim.fn.filereadable(buf_name) == 1 then
      -- Check that the buffer is not a terminal, scratch, or special buffer
      local buf_ft = vim.bo[buf].filetype
      if
          buf_ft ~= "terminal"
          and buf_ft ~= "netrw"
          and buf_ft ~= "scratch"
          and buf_ft ~= ""
          and vim.bo[buf].modifiable
          and vim.bo[buf].buflisted
          and vim.bo[buf].readonly == false
      then
        -- Save the buffer
        vim.api.nvim_buf_call(buf, function()
          vim.cmd("write")
        end)
      end
    end
  end
  print("Saved all open buffers with existing files.")
end

local function save_and_delete_all()
  save_existing_files()
  delete_all_buffers()
end

vim.api.nvim_create_user_command("SaveAll", save_existing_files, {})
vim.api.nvim_create_user_command("SaveDeleteAll", save_and_delete_all, {})
vim.api.nvim_create_user_command(
  "DeleteBackgroundBuffers",
  delete_background_buffers,
  {}
)

-- vim.keymap.set("n", "<leader>S", "<cmd>mksession! save.vim<CR>:wall|qa!<CR>")
map("n", "<leader>S", function()
  local git_dir = vim.fn.glob(".git")
  if git_dir ~= "" then
    -- Create a session file called `save.vim`
    save_existing_files()
    delete_background_buffers()
    vim.cmd("mksession! save.vim")
    vim.cmd([[qa!]])
  else
    save_existing_files()
    delete_background_buffers()
    vim.cmd([[qa!]])
  end
end)

-- Neogit
map('n', '<leader>g', '<cmd>Neogit<CR>')
-- Session
map("n", "<leader>q", "<cmd>mksession! save.vim<CR>:wall|qa!<CR>")
-- Buffers
map('n', '<ESC><ESC>', '<cmd>bd<CR>')
map('n', '<leader>bd', '<cmd>bd!<CR>')
map('n', '<leader>bw', '<cmd>bw<CR>')
map('n', '<leader>n', '<cmd>bp<CR>')
map('n', '<leader>m', '<cmd>bn<CR>')
-- Windows
map('n', '<c-k>', '<cmd>wincmd k<CR>')
map('n', '<c-j>', '<cmd>wincmd j<CR>')
map('n', '<c-h>', '<cmd>wincmd h<CR>')
map('n', '<c-l>', '<cmd>wincmd l<CR>')

map("t", "<M-k>", "<cmd>wincmd k<CR>")
map("t", "<M-j>", "<cmd>wincmd j<CR>")
map("t", "<M-h>", "<cmd>wincmd h<CR>")
map("t", "<M-l>", "<cmd>wincmd l<CR>")

map("n", "=", [[<cmd>vertical resize +5<cr>]])   -- make the window biger vertically
map("n", "-", [[<cmd>vertical resize -5<cr>]])   -- make the window smaller vertically
map("n", "+", [[<cmd>horizontal resize +2<cr>]]) -- make the window bigger horizontally by pressing shift and =
map("n", "_", [[<cmd>horizontal resize -2<cr>]]) -- make the window smaller horizontally by pressing shift and -
-- Adjustments
-- center after G
map({ "n", "v" }, "G", "Gzz")
-- center after search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Quickfix
map("n", "]q", "<cmd>cnext<cr>")
map("n", "[q", "<cmd>cprevious<cr>")

-- -- LSP Signature
-- map("n", "<leader>ls", function()
--   require("lsp_signature").on_attach()
-- end, { desc = "Attach LSP Signature" })


-- Treesitter
M.Custom_treesitter_mapping = {
  init_selection = "<C-e>",
  node_incremental = "<C-e>",
  scope_incremental = false,
  node_decremental = "<C-s>",
}

-- ## Oil ##
--
vim.defer_fn(function()
  local oil = require("oil")
  map("n", "§", oil.toggle_float)
end, 300)

M.Custom_oil_mappings = {
  ["g?"] = "actions.show_help",
  ["<CR>"] = "actions.select",
  ["<C-s>"] = { "actions.select", opts = { vertical = true }, desc = "Open the entry in a vertical split" },
  ["<C-h>"] = { "actions.select", opts = { horizontal = true }, desc = "Open the entry in a horizontal split" },
  ["<C-t>"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
  ["<C-p>"] = "actions.preview",
  ["<C-c>"] = "actions.close",
  ["<C-l>"] = "actions.refresh",
  ["§"] = "actions.parent",
  ["±"] = "actions.open_cwd",
  ["`"] = "actions.cd",
  ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
  ["gs"] = "actions.change_sort",
  ["gx"] = "actions.open_external",
  ["g."] = "actions.toggle_hidden",
  ["g\\"] = "actions.toggle_trash",
}

function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ''
  end
end

-- ## Telescope ##
vim.defer_fn(function()
  local builtin = require('telescope.builtin')
  -- Files
  map("n", "<leader><leader>", builtin.oldfiles, {})
  map('n', '<leader>fr', builtin.resume, {})
  map('n', '<leader>fp', builtin.git_status, {})
  map('n', '<leader>fb', builtin.buffers, {})
  -- Search
  map('n', '<leader>ff', builtin.find_files, {})
  map('n', '<leader>fg', builtin.live_grep, {})
  map('v', '<leader>fg', function()
    local text = vim.getVisualSelection()
    builtin.grep_string({ search = text })
  end, {})
  -- System
  map('n', '<leader>fk', builtin.keymaps, {})
  map('n', '<leader>fh', builtin.highlights, {})
end, 300)


M.Custom_telescope_mapping = {
  i = {
    ["<c-d>"] = function(arg)
      vim.api.nvim_command("wall")
      require("telescope.actions").delete_buffer(arg)
    end,
    ["<C-S-d>"] = function(arg)
      require("telescope.actions").delete_buffer(arg)
    end,
    ["<C-v>"] = require("telescope.actions").send_selected_to_qflist,
  },
  n = {
    ["<c-d>"] = function(arg)
      vim.api.nvim_command("wall")
      require("telescope.actions").delete_buffer(arg)
    end,
    ["<C-S-d>"] = function(arg)
      require("telescope.actions").delete_buffer(arg)
    end,
  }
}

M.Custom_telescope_undo_mapping = {
  { -- lazy style key map
    "<leader>u",
    "<cmd>Telescope undo<cr>",
    desc = "undo history",
  }
}

-- ## Cmp --
function M.Custom_cmp_actions(cmp_select)
  local cmp = require("cmp")
  return {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),

    ["<C-f>"] = cmp.mapping.scroll_docs(-4),
    ["<C-d>"] = cmp.mapping.scroll_docs(4),

    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),

    ["<C-k>"] = cmp.mapping({
      i = function()
        if cmp.visible() then
          cmp.abort()
        else
          cmp.complete()
        end
      end,
      c = function()
        if cmp.visible() then
          cmp.close()
        else
          cmp.complete()
        end
      end,
    }),
  }
end

function M.Custom_lsp_actions(opts)
  local builtin = require('telescope.builtin')
  map('n', 'K', vim.lsp.buf.hover, opts)
  map('n', 'gd', builtin.lsp_definitions, opts)
  map('n', 'gi', builtin.lsp_implementations, opts)
  map('n', 'gr', builtin.lsp_references, opts)
  map('n', 'go', builtin.lsp_type_definitions, opts)
  map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
  map('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
  map('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
  map("n", "]g", vim.diagnostic.goto_next)
  map("n", "[g", vim.diagnostic.goto_prev)
  map('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
end

-- Git
vim.defer_fn(function()
  local gitsigns = require("gitsigns")
  map('n', '<leader>hS', gitsigns.stage_buffer)
  map('n', '<leader>hU', gitsigns.reset_buffer)

  map({ 'n', 'v' }, '<leader>hs', gitsigns.stage_hunk)
  map({ 'n', 'v' }, '<leader>hr', gitsigns.reset_hunk)
  map('n', '<leader>hu', gitsigns.undo_stage_hunk)

  map('n', '<leader>hd', gitsigns.diffthis)
  map('n', '<leader>hD', function() gitsigns.diffthis('~') end)

  map("n", "<leader>hp", gitsigns.preview_hunk)
  map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end)

  map("n", '<leader>hv', gitsigns.select_hunk)
  map("n", ']h', gitsigns.next_hunk)
  map("n", '[h', gitsigns.prev_hunk)
end, 300)

-- Trouble
M.Custom_trouble_bindings = {
  {
    "<leader>xx",
    "<cmd>Trouble diagnostics toggle<cr>",
    desc = "Diagnostics (Trouble)",
  },
  {
    "<leader>xX",
    "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
    desc = "Buffer Diagnostics (Trouble)",
  },
  {
    "<leader>cs",
    "<cmd>Trouble symbols toggle focus=false<cr>",
    desc = "Symbols (Trouble)",
  },
  {
    "<leader>cl",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP Definitions / references / ... (Trouble)",
  },
  {
    "<leader>xL",
    "<cmd>Trouble loclist toggle<cr>",
    desc = "Location List (Trouble)",
  },
  {
    "<leader>xQ",
    "<cmd>Trouble qflist toggle<cr>",
    desc = "Quickfix List (Trouble)",
  },
}

-- ## Marks ##
M.Custom_marks_mappings = {
  set = "m",
  delete = "dm",
  delete_buf = "dm-",
  next = "]m",
  prev = "[m",
}

-- ## DAP ##
M.Custom_dap_mappings = {
  {
    "<leader>db",
    function()
      require('dap').toggle_breakpoint()
    end,
    desc = "Toggle Breakpoint",
  },
  {
    "<leader>dC",
    function()
      require('dap').clear_breakpoints()
    end,
    desc = "Clear Breakpoints",
  },
  {
    "<leader>dl",
    function()
      require('dap').list_breakpoints()
    end,
    desc = "List Breakpoints",
  },
  {
    "<leader>do",
    function()
      require("dap").step_over()
    end,
    desc = "Step Over",
  },
  {
    "<leader>di",
    function()
      require("dap").step_into()
    end,
    desc = "Step Into",
  },
  {
    "<leader>dI",
    function()
      require("dap").step_out()
    end,
    desc = "Step Out",
  },
  {
    "<leader>da",
    function()
      if vim.fn.filereadable(".vscode/launch.json") then
        local dap_vscode = require("dap.ext.vscode")
        dap_vscode.load_launchjs(nil, {
        })
      end
      require("dap").continue()
    end,
  },
  {
    "<leader>dc",
    function()
      require("dap").continue()
    end,
  }
}


-- ## Harpoon ##

-- vim.defer_fn(function()
--   local harpoon = require("harpoon")
--   map("n", "<leader>a", function()
--     local fname = vim.fn.expand("%")
--     local _, idx = harpoon:list():get_by_value(fname)
--     if idx == nil then
--       harpoon:list():add()
--       print("Added")
--     else
--       harpoon:list():remove_at(idx)
--       print("Removed")
--     end
--   end)
--   map("n", "<leader>e", function()
--     harpoon.ui:toggle_quick_menu(harpoon:list())
--   end)
--
--   map("n", "1", function()
--     harpoon:list():select(1)
--   end)
--   map("n", "2", function()
--     harpoon:list():select(2)
--   end)
--   map("n", "3", function()
--     harpoon:list():select(3)
--   end)
--   map("n", "4", function()
--     harpoon:list():select(4)
--   end)
--   map("n", "5", function()
--     harpoon:list():select(5)
--   end)
-- end, 300)

-- ## Diffview ##
map("n", "<leader>dd", function()
  local lib = require("diffview.lib")
  local view = lib.get_current_view()
  if view then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end)

-- ## Git Conflict ##
map('n', 'co', ':GitConflictChooseOurs<CR>')
map('n', 'ct', ':GitConflictChooseTheirs<CR>')
map('n', 'cb', ':GitConflictChooseBoth<CR>')
map('n', 'c0', ':GitConflictChooseNone<CR>')
map('n', '[x', ':GitConflictPrevConflict<CR>')
map('n', ']x', ':GitConflictNextConflict<CR>')
map('n', 'C-x', ':GitConflictListQf<CR>')

return M
