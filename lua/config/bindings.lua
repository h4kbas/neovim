local M = {}
vim.g.mapleader = " "

-- ## Vim ##
-- Terminal
map("n", "<leader>tt", "<cmd>tabnew | te<CR>", { noremap = true })
map("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true })
-- Save
map("n", "S", "s", { noremap = true })
map(
  "n",
  "s",
  "<cmd>w|lua vim.defer_fn( function()vim.cmd('echom \"\"') end, 0)<CR>",
  { noremap = false }
)
-- Session
map("n", "<leader>q", "<cmd>mksession! save.vim<CR>:wall|qa!<CR>")
-- Buffers
map('n', '<leader>bd', '<cmd>bd!<CR>')
map('n', '<leader>bw', '<cmd>bw<CR>')
map('n', '<leader>bn', '<cmd>enew<CR>')
-- Navigation
map('n', '<c-k>', '<cmd>wincmd k<CR>')
map('n', '<c-j>', '<cmd>wincmd j<CR>')
map('n', '<c-h>', '<cmd>wincmd h<CR>')
map('n', '<c-l>', '<cmd>wincmd l<CR>')

map("t", "<M-k>", "<cmd>wincmd k<CR>")
map("t", "<M-j>", "<cmd>wincmd j<CR>")
map("t", "<M-h>", "<cmd>wincmd h<CR>")
map("t", "<M-l>", "<cmd>wincmd l<CR>")
-- Adjustments
-- center after G
map({ "n", "v" }, "G", "Gzz")
-- center after search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


-- Treesitter
M.Custom_treesitter_mapping = {
  init_selection = "<C-e>",
  node_incremental = "<C-e>",
  scope_incremental = false,
  node_decremental = "<C-s>",
}


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

-- Git
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


return M
