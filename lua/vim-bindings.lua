local map = vim.keymap.set

vim.g.mapleader = " "

-- Navigate vim panes better
map('n', '<c-k>', ':wincmd k<CR>')
map('n', '<c-j>', ':wincmd j<CR>')
map('n', '<c-h>', ':wincmd h<CR>')
map('n', '<c-l>', ':wincmd l<CR>')

map('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- Save
map('n', 'S', 's')
map('n', 's', ':w<cr>')

-- Move selected lines up/down in visual mode
map("x", "K", ":move '<-2<CR>gv=gv", {})
map("x", "J", ":move '>+1<CR>gv=gv", {})
