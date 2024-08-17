local map = vim.keymap.set

vim.g.mapleader = " "

-- Navigate vim panes better
map('n', '<c-k>', ':wincmd k<CR>')
map('n', '<c-j>', ':wincmd j<CR>')
map('n', '<c-h>', ':wincmd h<CR>')
map('n', '<c-l>', ':wincmd l<CR>')

map('n', '<M-Up>', ':wincmd k<CR>')
map('n', '<M-Down>', ':wincmd j<CR>')
map('n', '<M-Left>', ':wincmd h<CR>')
map('n', '<M-Right>', ':wincmd l<CR>')

-- Terminal
map('t', '<C-w>h', "<C-\\><C-n><C-w>h", { silent = true })

map("t", "<M-k>", ":wincmd k<CR>")
map("t", "<M-j>", ":wincmd j<CR>")
map("t", "<M-h>", ":wincmd h<CR>")
map("t", "<M-l>", ":wincmd l<CR>")

map("t", "<M-Up>", ":wincmd k<CR>")
map("t", "<M-Down>", ":wincmd j<CR>")
map("t", "<M-Left>", ":wincmd h<CR>")
map("t", "<M-Right>", ":wincmd l<CR>")



map('n', '<leader>h', ':nohlsearch<CR>')

-- Save
map('n', 'S', 's')
map('n', 's', ':w<cr>')

-- Move selected lines up/down in visual mode
map("x", "K", ":move '<-2<CR>gv=gv")
map("x", "J", ":move '>+1<CR>gv=gv")
map("x", "<S-Up>", ":move '<-2<CR>gv=gv")
map("x", "<S-Down>", ":move '>+1<CR>gv=gv")

-- Move line up down in normal
map("n", "<S-Up>", "yyddkP")
map("n", "<S-Down>", "yyddp")
map("n", "K", "yyddkP")
map("n", "J", "yyddp")

-- Copy line up/down in normal
map("n", "<M-S-Up>", "yyP")
map("n", "<M-S-Down>", "yyp")
map("n", "<M-S-k>", "yyP")
map("n", "<M-S-j>", "yyp")

-- Buffers
map('n', '<leader>bd', ':bd<CR>')
map('n', '<leader>bw', ':bw<CR>')
map('n', '<leader>bn', ':enew<CR>')
