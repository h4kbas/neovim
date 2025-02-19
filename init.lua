local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

if vim.g.neovide then
  vim.o.guifont = "Hack Nerd Font:h12"
  vim.g.neovide_scale_factor = 1.0
  vim.g.neovide_position_animation_length = 0
  vim.g.neovide_scroll_animation_length = 0
  vim.g.neovide_cursor_trail_size = 0

  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_cursor_antialiasing = true

  vim.g.neovide_cursor_animate_in_insert_mode = false
  vim.g.neovide_cursor_animate_command_line = false
end


require("config.colors")
require("config.general")
require("lazy-init")
require("config.bindings")
require("config.errors")
require("config.folding")
require("config.quickfix")
require("config.rules")
