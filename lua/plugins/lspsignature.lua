return {
  {
    'ray-x/lsp_signature.nvim',
    event = 'VeryLazy',
    config = function()
      require('lsp_signature').setup({
        bind = true,
        handler_opts = {
          border = 'rounded',
        },
        -- hint_enable = false, -- disable virtual text hint
        -- floating_window = true,
        -- floating_window_above_cur_line = true,
        -- fix_pos = true,
      })
    end
  }
}
