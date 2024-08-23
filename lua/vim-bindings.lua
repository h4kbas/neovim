local map = vim.keymap.set

vim.g.mapleader = " "

-- Session
map("n", "<leader>q", "<cmd>mksession! save.vim<CR>:wall|qa!<CR>")

-- Navigation
map('n', '<c-k>', '<cmd>wincmd k<CR>')
map('n', '<c-j>', '<cmd>wincmd j<CR>')
map('n', '<c-h>', '<cmd>wincmd h<CR>')
map('n', '<c-l>', '<cmd>wincmd l<CR>')

map('n', '<M-Up>', '<cmd>wincmd k<CR>')
map('n', '<M-Down>', '<cmd>wincmd j<CR>')
map('n', '<M-Left>', '<cmd>wincmd h<CR>')
map('n', '<M-Right>', '<cmd>wincmd l<CR>')

map("t", "<M-k>", "<cmd>wincmd k<CR>")
map("t", "<M-j>", "<cmd>wincmd j<CR>")
map("t", "<M-h>", "<cmd>wincmd h<CR>")
map("t", "<M-l>", "<cmd>wincmd l<CR>")

map("t", "<M-Up>", "<cmd>wincmd k<CR>")
map("t", "<M-Down>", "<cmd>wincmd j<CR>")
map("t", "<M-Left>", "<cmd>wincmd h<CR>")
map("t", "<M-Right>", "<cmd>wincmd l<CR>")



map('n', '<leader>h', '<cmd>nohlsearch<CR>')

-- Save
vim.keymap.set("n", "S", "s", { noremap = true })
vim.keymap.set(
  "n",
  "s",
  "<cmd>w|lua vim.defer_fn( function()vim.cmd('echom \"\"') end, 0)<CR>",
  { noremap = false }
)

-- Move selected lines up/down in visual mode
-- map("x", "K", "<cmd>move '<-2<CR>gv=gv")
-- map("x", "J", "<cmd>move '>+1<CR>gv=gv")
map("x", "<S-Up>", "<cmd>move '<-2<CR>gv=gv")
map("x", "<S-Down>", "<cmd>move '>+1<CR>gv=gv")

-- Move line up down in normal
map("n", "<S-Up>", "yyddkP")
map("n", "<S-Down>", "yyddp")
-- map("n", "K", "yyddkP")
-- map("n", "J", "yyddp")

-- Copy line up/down in normal
map("n", "<M-S-Up>", "yyP")
map("n", "<M-S-Down>", "yyp")
map("n", "<M-S-k>", "yyP")
map("n", "<M-S-j>", "yyp")

-- Buffers
map('n', '<leader>bd', '<cmd>bd!<CR>')
map('n', '<leader>bw', '<cmd>bw<CR>')
map('n', '<leader>bn', '<cmd>enew<CR>')

-- Panes
map('n', '<leader>s', '<cmd>split<CR>')
map('n', '<leader>S', '<cmd>vsplit<CR>')

map("n", "<leader>s<Left>", "<C-w>H", {})
map("n", "<leader>s<Right>", "<C-w>L", {})
map("n", "<leader>s<Up>", "<C-w>K", {})
map("n", "<leader>s<Down>", "<C-w>J", {})


map("n", "<C-d>", "15j", { noremap = true })
map("n", "<C-f>", "15k", { noremap = true })

-- center after search
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- center after G
map({ "n", "v" }, "G", "Gzz")

-- Terminal
map("n", "<leader>tt", "<cmd>tabnew | te<CR>", { noremap = true })
map("t", "<ESC><ESC>", "<C-\\><C-n>", { noremap = true })
