-- Tab width 2 spaces
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.background = "light"

vim.opt.swapfile = false

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')
vim.wo.number = true

-- Merge clipboard with OS
vim.cmd("set clipboard=unnamed")

-- Enable mouse
vim.cmd("set mouse=a")

-- No backup files
vim.cmd("set nobackup")

-- More lines on cmd line
vim.cmd("set cmdheight=2")

-- Enconding
vim.cmd("set encoding=utf-8")
vim.cmd("set fileencoding=utf-8")
vim.cmd("set fileencodings=utf-8")
vim.cmd("set ttyfast")

-- Line editing
vim.cmd("set ve+=onemore")
